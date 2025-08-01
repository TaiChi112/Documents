interface ICharacter {
    attack(): void
    defend(): void
}

class Warrior implements ICharacter {
    attack(): void {
        console.log("Warrior attacks with a sword!");
    }

    defend(): void {
        console.log("Warrior defends with a shield!");
    }
}

class Mage implements ICharacter {
    attack(): void {
        console.log("Mage casts a fireball!");
    }

    defend(): void {
        console.log("Mage shields with a magic barrier!");
    }
}
class Archer implements ICharacter {
    attack(): void {
        console.log("Archer shoots an arrow!");
    }

    defend(): void {
        console.log("Archer dodges with agility!");
    }
}

abstract class CharacterFactory {
    abstract createCharacter(): ICharacter;

    public getCharacter(): ICharacter {
        const character = this.createCharacter();
        character.attack();
        character.defend();
        return character;
    }
}
class WarriorCharacterFactory extends CharacterFactory {
    createCharacter(): ICharacter {
        return new Warrior();
    }
}

class MageCharacterFactory extends CharacterFactory {
    createCharacter(): ICharacter {
        return new Mage();
    }
}

class ArcherCharacterFactory extends CharacterFactory {
    createCharacter(): ICharacter {
        return new Archer();
    }
}

class Client {
    client(factory: CharacterFactory): ICharacter {
        return factory.getCharacter();
    }
}
// Usage
const warriorFactory = new WarriorCharacterFactory();
const mageFactory = new MageCharacterFactory();
const archerFactory = new ArcherCharacterFactory();

const client = new Client();
console.log(`---`);
client.client(warriorFactory);
console.log(`---`);

client.client(mageFactory);
console.log(`---`);

client.client(archerFactory);

