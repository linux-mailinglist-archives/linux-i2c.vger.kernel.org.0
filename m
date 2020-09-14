Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6EA268983
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 12:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgINKmv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 06:42:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37999 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726466AbgINKmk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Sep 2020 06:42:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bqjc052t6z9sTS;
        Mon, 14 Sep 2020 20:42:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600080146;
        bh=jqSJTAAE2viP+VO1tceykIVX3foZjPzbA2zwdIB6bEI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PlHbxoBHG5ylBadCb1uIKkkEA099PgfyJFldyi+NHbZfDaCtkzM6SFCtuBcHki+XO
         j88VvgTfUiAqoPvu2P6c1kM2+TEK4VXYjvgp0GQqtQdHa4O5+YjBFlQlDRSxEN9xbU
         9MN7LRZnZva62eVRmLnVdp0WEWJqvUgb3F6Gkv8h3AJi9j2DsB6N+SZnMFhLm4FnoV
         bmsxyC3MOSX3s42hADtlc6M9hxlYioX2EYSt+hAuuZkq/MC/+KUVyjjkYa4ZUKsJSK
         CyoLooZWXlxbqM8TUtfgjwoaVbztAj3vs9OZW5J9sa3n2uEYommZMPVSt8q3fVUDRt
         yfcAj785z1T3g==
Date:   Mon, 14 Sep 2020 20:42:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Wolfram Sang <wsa@kernel.org>,
        Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Message-ID: <20200914204223.5a96f84d@canb.auug.org.au>
In-Reply-To: <CAHp75Vf-1vqHjqNixXtnziCd6squwwj0sEArZ8C1YiDwafhk7Q@mail.gmail.com>
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
        <20200909082338.GC2272@ninjato>
        <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
        <20200911194526.GB909@ninjato>
        <61c139a0-26fc-8cd1-0b54-b7cb9d9c0648@alliedtelesis.co.nz>
        <CAHp75VdtE_UBsNrSxbVPprmp7=-iVCrXv9x6Tu82b4q2ODfKQg@mail.gmail.com>
        <CAHp75Vf-1vqHjqNixXtnziCd6squwwj0sEArZ8C1YiDwafhk7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cHmrJ/D4znt7MYG1cUv/aML";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Sig_/cHmrJ/D4znt7MYG1cUv/aML
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, 14 Sep 2020 11:51:04 +0300 Andy Shevchenko <andy.shevchenko@gmail.c=
om> wrote:
>
> On Mon, Sep 14, 2020 at 11:50 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Sep 14, 2020 at 12:27 AM Chris Packham
> > <Chris.Packham@alliedtelesis.co.nz> wrote: =20
> > > On 12/09/20 7:45 am, Wolfram Sang wrote: =20
> > =20
> > > I'm happy to route it to stable@ if you think it's worth it but I don=
't
> > > think there's a specific Fixes: reference that can be used. The curre=
nt
> > > behavior appears to have been that way since before git (looks like we
> > > noticed in 2014 but it's taken me 6 years to nag people into sending
> > > their fixes upstream). =20
> >
> > JFYI: there is a history.git repository from History Group on
> > kernel.org. You may dig till the very beginning of the kernel (yes,
> > it's not properly formed Git history, but it will give you a hash
> > commit as a reference. =20
>=20
> Stephen, btw, does your scripts that validate Fixes, take into
> consideration references to history.git?

I assuming you are referring to
https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git

I have found a few by hand in the past (I also missed a few), but I
guess I could expend the checks.

Maybe that tree could be put somewhere that appears more permanent if
we are going to permanently refer to it? (Or has that happened already?)
--=20
Cheers,
Stephen Rothwell

--Sig_/cHmrJ/D4znt7MYG1cUv/aML
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9fSQ8ACgkQAVBC80lX
0Gy2Sgf/Uk1aL4NRj/kH6KJ6MvTqkkqOH4OcuMvhjgPGgwjvDpRFWXw3K9c4XxbU
DN3dshR27b4lOn3g4pB5Fy6Xr41f5fX7L3z5Qw0fzmsxmdNHyh/V+7UUvGhOTQo9
0ON2Z2at3wKyEuUIweOrWV52twydCRMwr9cDE3io+76ro2b4UOX/M4jlnSSE4HT1
o6WTsuYAgpdYf+cWeejOs5AMEOukYxsmN9Zmr4rEeCaOCZdFOTTuBCvedI+989qK
8Capogbs3ZzBufYKm7i1v4LVzb0Dc0pqA4cfvKN6MoAs3K+PxusctkzZQfvAIaPq
Y5K1lkYJ9Mq/VQqkhsR4sM8BWIxfjg==
=wEB6
-----END PGP SIGNATURE-----

--Sig_/cHmrJ/D4znt7MYG1cUv/aML--
