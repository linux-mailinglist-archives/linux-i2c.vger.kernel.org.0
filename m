Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B94956D7E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 17:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfFZPUR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 11:20:17 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:46316 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfFZPUQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jun 2019 11:20:16 -0400
X-Greylist: delayed 28995 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jun 2019 11:20:15 EDT
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
        by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 45YmtQ37lwz1XLG7J;
        Wed, 26 Jun 2019 17:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key1-intmail; t=1561562414;
        bh=brOTsNdTPJ5plf10dFzc0FfJiVLR3ifComvWPdhZwFI=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=1hnGT1sc8Xql7FC3XYEeyjcufXNrBPygoPXkfUHI7ZuRu2Iye94XvNg3l0ka/9lkt
         Dq2aEC3ExG9WHSEXLXHY6plbsuMJlkkP4hVQzf+DhIyvLKgM5HTN2kLqyqNgm0evk+
         tTd3TDQUCfy9jDphYGKVhfsPNrSAizh+RNb2/HU0=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
        by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 45YmtP6qW7z6CjQSN;
        Wed, 26 Jun 2019 17:20:13 +0200 (CEST)
X-AuditID: 0a3aad10-03fff70000007f88-a4-5d138d2daba4
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id A9.9F.32648.D2D831D5; Wed, 26 Jun 2019 17:20:13 +0200 (CEST)
Received: from FE-MBX2050.de.bosch.com (fe-mbx2050.de.bosch.com [10.3.231.60])
        by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 45YmtP4MRpznqj;
        Wed, 26 Jun 2019 17:20:13 +0200 (CEST)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
 FE-MBX2050.de.bosch.com (10.3.231.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 26 Jun 2019 17:20:13 +0200
Received: from FE-MBX2051.de.bosch.com ([fe80::d5b5:44fa:ef15:153e]) by
 FE-MBX2051.de.bosch.com ([fe80::d5b5:44fa:ef15:153e%6]) with mapi id
 15.01.1713.007; Wed, 26 Jun 2019 17:20:13 +0200
From:   "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Kjetil Aamodt <kjetilaamodt@gmail.com>
CC:     "WANG Xin (BT-FIR/ENG1-Zhu)" <Xin.Wang7@cn.bosch.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
Subject: AW: Bug present in at24.c in 4.14 kernel
Thread-Topic: Bug present in at24.c in 4.14 kernel
Thread-Index: AdUqqsR+9F+soRsLRNOF7W0j3oP9G///5iQAgAAVCACAAAczAIAA338AgADpZgD//0OMYP/+AGdg
Date:   Wed, 26 Jun 2019 15:20:13 +0000
Message-ID: <c3336be1ef4e479cba09d3469dfea187@de.bosch.com>
References: <12a06d759e3d44a89ae41f65631c16c5@de.bosch.com>
 <20190624170228.GB6164@kunai>
 <CAKAz2q0x8Qi8+RT2dFNv74X1Cm_SyTUvzBmnZ-YN_x6d3bQS4Q@mail.gmail.com>
 <20190624184330.GA8035@kunai>
 <CAKAz2q3_jCRB0=tOF4BWMc8Bof0GGw_G_rQaeFM+ZPjxfD7WLg@mail.gmail.com>
 <20190625215848.GA2987@kunai> <8d3189f60c5a47598c2dc62757558dc7@de.bosch.com>
In-Reply-To: <8d3189f60c5a47598c2dc62757558dc7@de.bosch.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.142.147]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TfUwbdRjmx13LUTk4ruv6roDEDqeiZRRmZGOSKZthRgbqTBSHcsBBO2lL
        egUBjaIL++gCYpGNFVY+9gXTjaUS3IcbUDBbcWQqca4ZEBLYInOoge7LCHi3g7V/+M/l+T3P
        +zzv+3vvjsBoJ6Ei9EYLazYyRWqpDJetOxGl0VTLs+OtvZqks+Pd0qRjdRdQ0u45L0rquGTH
        NuBph65el6SdsY8GpbkHJ/G0WefjmXiWbH0+W6QvZc2rU3JkOtuhZ4r/Di5bmOyWVKLpICsK
        JoBaA1/PzCAB01RDINzredeKZDw+h6Cz7jgSD9MIHlzcjYuHXgQ7KicwwSKl1sGuoz8+jFpG
        vQb7WpqlAsaoIQTtVlLAckoLN5u+lIo1CTCxv4YPInicBW2eTwQap56ElqoxiYBJKhnqfzkp
        EXt5AqGu2YMLQjC1HvZfHX6Yg6goOHXqCib2UoLz5j2JeB0KDn8v8kApYGpiXiL0AuoJaGp4
        WSyPg2v1Xy2O+Swcbf0DE/uGg/vAJF6LlHa/VLufxe5nsftZWhB+HCkK2PhSwwtrtUlx5lyW
        q4jXxuWZDE4kvj7qNDozWOBCFIHUIeRCiTybljClXLnBhZ4nAtUKkv2WzqZDc0355TqG071v
        LiliObWKjPzp1W20/BHNleQa9BynNxldCAhMvYw8wlDZNJnPlFewZpNoc6EIAlcryUIiYxtN
        FTIW9gOWLWbNS2oyQaiBbLbyM4Sb2UK2rEBfZFmS1VEkCggIoJf7K/5tA4lgF0okQvjew0IE
        yRUzBk5fuGhfIdrpJdZnHUSbidqpg20Y0feDow2jcaPJyKqUZOZePoUS6nUlxkdzqCLJlem8
        oPATfFm3kAfxm5STEYI5hP9XfBMAGSEsLXyR9JkSjvAeqkkKPZ5h/uOen8bgvncPf2y0hcI/
        B+rDwN3VHwb3v2mn4VrNX0pw2GcAGn7tjwLnLP/4zHUjGmaPda+Es9dvPA0PdozEwr+tnRrw
        3rmoge6mqTj47fbP8eAY6E8Ax92+F2H+7mgKDHSOboThSccmODfu2QSHqz9/BXrcTZvh5E5n
        Opze15cOewZaM6C+o/FN8Fbbtt7i1xvIrzenihbWa2Es/7PeRdZ3O1Ul+tj1p+Ry1eXERPrS
        eUXM6rk13Nancr74HcZTP+ySc49tqXydSnib3R60du/tO7GJc9GpO0cyRrI0ee0L0502bGj5
        Be+QVJU31lth2r7ljcZ3vouJVEWXJdu66lMO1mht+HPsextXZYaF7vrIoOy7smFsxUurOnBn
        TMyn50+kuiPeiqlV45yO0cZiZo75D+O0V+jFBAAA
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> > > If you can send your 4.14 patch for inclusion in 4.14, and ask for
> > > 9a9e295e7c5c0409c020088b0ae017e6c2b7df6e to be merged to 4.19 I
> > think
> > > we are all good here.
> >
> > This goes to Jonas, I had nothing to do with this patch other than
> > applying the version which was sent to me.
> >
> > I agree though, that it would be nice if Jonas could send this patch
> > for 4.14, so it could be send further to stable kernels.
>=20
> I already started working on preparing patches for the stable mailing lis=
t.
> My time budget is just very tight. Please bear with me.
>=20
> I will put you, Kjetil and linux-i2c on CC.

I sent the patches to stable@vger.kernel.org. I hope I got the format right=
.

I forgot to put linux-i2c on CC but added Bartosz Golaszewski who accepted =
the original patch.

Greetings,
Mark

Mark Jonas

Building Technologies, Panel Software Fire (BT-FIR/ENG1)=20
Bosch Sicherheitssysteme GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMANY =
| www.boschsecurity.com

Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118=20
Aufsichtsratsvorsitzender: Christian Fischer; Gesch=E4ftsf=FChrung: Tanja R=
=FCckert, Andreas Bartz, Thomas Quante, Bernhard Schuster=20

