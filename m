Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19CB756343
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 09:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfFZHYU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 03:24:20 -0400
Received: from de-deferred2.bosch-org.com ([139.15.180.217]:40082 "EHLO
        de-deferred2.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725954AbfFZHYU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jun 2019 03:24:20 -0400
X-Greylist: delayed 436 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jun 2019 03:24:17 EDT
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 45YZ8r52b6z43Y
        for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2019 09:17:00 +0200 (CEST)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 45YZ8p56Rrz1XLDR3;
        Wed, 26 Jun 2019 09:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=2015-01-21; t=1561533418;
        bh=brOTsNdTPJ5plf10dFzc0FfJiVLR3ifComvWPdhZwFI=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=PjNWQtOEuVT/4MPCJUevjhj9g6nLCia0p0UBMXTZSAVwOzS982ODXdVjpTMQevOWv
         QaF6wpqyk8f0drEguii6qqthw8cAwIi7UMsMdqZ6uy2LwQaiAuypzg1g9ygunbn0sB
         wwupu3JcpZWKWbXbO+iy/ZPjemUYJbiNgH1bm/e4=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 45YZ8p4XNgz1bH;
        Wed, 26 Jun 2019 09:16:58 +0200 (CEST)
X-AuditID: 0a3aad15-c59ff70000001b94-24-5d131bea14ed
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id D2.46.07060.AEB131D5; Wed, 26 Jun 2019 09:16:58 +0200 (CEST)
Received: from FE-MBX2051.de.bosch.com (fe-mbx2051.de.bosch.com [10.3.231.61])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 45YZ8p2yXpz5gg;
        Wed, 26 Jun 2019 09:16:58 +0200 (CEST)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
 FE-MBX2051.de.bosch.com (10.3.231.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 26 Jun 2019 09:16:58 +0200
Received: from FE-MBX2051.de.bosch.com ([fe80::d5b5:44fa:ef15:153e]) by
 FE-MBX2051.de.bosch.com ([fe80::d5b5:44fa:ef15:153e%6]) with mapi id
 15.01.1713.007; Wed, 26 Jun 2019 09:16:58 +0200
From:   "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Kjetil Aamodt <kjetilaamodt@gmail.com>
CC:     "WANG Xin (BT-FIR/ENG1-Zhu)" <Xin.Wang7@cn.bosch.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
Subject: AW: Bug present in at24.c in 4.14 kernel
Thread-Topic: Bug present in at24.c in 4.14 kernel
Thread-Index: AdUqqsR+9F+soRsLRNOF7W0j3oP9G///5iQAgAAVCACAAAczAIAA338AgADpZgD//0OMYA==
Date:   Wed, 26 Jun 2019 07:16:58 +0000
Message-ID: <8d3189f60c5a47598c2dc62757558dc7@de.bosch.com>
References: <12a06d759e3d44a89ae41f65631c16c5@de.bosch.com>
 <20190624170228.GB6164@kunai>
 <CAKAz2q0x8Qi8+RT2dFNv74X1Cm_SyTUvzBmnZ-YN_x6d3bQS4Q@mail.gmail.com>
 <20190624184330.GA8035@kunai>
 <CAKAz2q3_jCRB0=tOF4BWMc8Bof0GGw_G_rQaeFM+ZPjxfD7WLg@mail.gmail.com>
 <20190625215848.GA2987@kunai>
In-Reply-To: <20190625215848.GA2987@kunai>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.142.147]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TbUwTdxjvv3etR8fJcZX1scgc3cwWFhhlOgkC2ZaxwMRg1OFc6MYxjrYZ
        bUmPMuqHRbcwhA2Ddb5QagFTfIsTUpgRJCIFN4pb1OA2UNkgRZJiZS+gwwXNehzYfti35/m9
        PM/z/12OwOgzhJLQG8tZs5EpVUlluCzt27jE6Vi5Jvmea23qyYOXUOq+x3Mo9fSgHXsDy+6y
        j63I9g5N4tmz7ue2Yh/I0ovZUn0Fa341s1Cms926JS5rISqHR66L96Cb0loUQQC1HhoGu8W1
        SEbQ1FEx7K3zYkJzEcG1U7eR0NxHEJg5KBGaywhmjzgQ75dSaVB94uoKvl5F5cLh5iYpL8Ko
        swg6HV8viuSUGqYcB6SCKAV8R/bjtYgI1vlgu/E8X+LUOqjzLSpIahME9s0vXXFaDON/PcR4
        IoJKgJ6mmzhfIyoO2tuvLeIYpQD31D8S4T0UuHoEHKgY8PueSPj5QMWD4+hbgjwJRg59IxXq
        V+BEyz1M2BsN3oZJvB4p7GFT7WEWe5jFHmZpRvgZFFPCJlcY1BvXq5PMRSy3O1md9LHJ4EbC
        Z4u5gP70l3gQRSBVJPm+RK6hJUwFZzV40AZCrIoh2Q5aQ68sMhVbdQyn+8hsKWU5lZJcc/3d
        Alr+FOYsRQY9x+lNRg8CAlOtIlsZSkOTxYx1N2s2CTYPiiVwlYLUEnkFNKVlytlPWLaMNS+z
        mwhCBaRNGbwh2sxq2coSfWn5Mq2KI5FIJKKfDWfC14qJCA96jYgM7jbxI0iujDFweu2SfbVg
        p5fRkHUI5RD1/mPHMaLvivM4RuNGk5FVKshJfgrF63UW49M7lGvIqzujNHRMGBGaNY1GUTBJ
        OdnNmyOD/0joAiBj+dCil8CQKaU16KF+kkDv6DCCtif3MZifq5FCb6NtJfzbcCgKvJ39UTB/
        9hQNI/v/UIDT/jeAe7Y/DvZ67q6F2ZPnX4Du23dfhkdf3EmAhZa2RJh78EMinHf4k+DXwI1k
        cA70p4DzYV8GDLSNvQ3Dk84suDg+mgWuus/fgV6vIwfOfeneAhcO922BmoGWPJirs+2AO4HW
        XTAaGNoFE981aaaD8YqD8RZW0Xy85Uz5/8S7hIZep9yDEr6ayPRsaxSP+HKzpH5L1O+X2+rT
        tvfodes88Q+yKwcLMyyN3viFoS72598WPiz4seOZTx+PuXKrbNtMm+czHMZ0Z3fq6tfLRBvP
        dXy/Pe2SsuPN8SvHdjKPrDs6aVFyjqk9z1bV9V51fgD/xZo+81L+hgnfi82JNdrMz6Yaqmdc
        KSqc0zHqBMzMMf8BiSa6Dr0EAAA=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,
=20
> > If you can send your 4.14 patch for inclusion in 4.14, and ask for
> > 9a9e295e7c5c0409c020088b0ae017e6c2b7df6e to be merged to 4.19 I
> think
> > we are all good here.
>=20
> This goes to Jonas, I had nothing to do with this patch other than applyi=
ng
> the version which was sent to me.
>=20
> I agree though, that it would be nice if Jonas could send this patch for
> 4.14, so it could be send further to stable kernels.

I already started working on preparing patches for the stable mailing list.=
 My time budget is just very tight. Please bear with me.

I will put you, Kjetil and linux-i2c on CC.

Greetings,
Mark

Mark Jonas

Building Technologies, Panel Software Fire (BT-FIR/ENG1)=20
Bosch Sicherheitssysteme=A0GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMAN=
Y | www.boschsecurity.com

Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118=20
Aufsichtsratsvorsitzender: Christian Fischer; Gesch=E4ftsf=FChrung: Tanja R=
=FCckert, Andreas Bartz, Thomas Quante, Bernhard Schuster=20
