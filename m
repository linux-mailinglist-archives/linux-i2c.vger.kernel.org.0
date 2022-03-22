Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51C6E4E458A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Mar 2022 18:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239928AbiCVRxp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Mar 2022 13:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbiCVRxn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Mar 2022 13:53:43 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D6E8D6AF;
        Tue, 22 Mar 2022 10:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647971499;
        bh=8I3GWS6pWMeWlp9zUKzJSs1LzgYKqg1PVBPAq/Lm0LU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=QGdT7wfvtbx7EEq50BWSNOASiB8Ii9nryA7qMItQPCg349ur6bRln9+OctCQWWaFw
         sKEmfK1ssCrodaywip/zGtr1TH9dzGkPDga3DON2C8SDJrjv3Q4Yk4TNwFde19j3Rf
         TgNQQ5wqXK/XhOkavE7/CibOdmg6poxuBj+4PKko=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGz1V-1nJIfA2WJf-00E1fI; Tue, 22
 Mar 2022 18:51:39 +0100
Date:   Tue, 22 Mar 2022 18:51:35 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Avi Fishman <avifishman70@gmail.com>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Tomer Maimon <tmaimon77@gmail.com>, KWLIU@nuvoton.com,
        Tali Perry <tali.perry1@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        JJLIU0@nuvoton.com, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tomer Maimon <tomer.maimon@nuvoton.com>,
        devicetree <devicetree@vger.kernel.org>, bence98@sch.bme.hu,
        Arnd Bergmann <arnd@arndb.de>, sven@svenpeter.dev,
        Rob Herring <robh+dt@kernel.org>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        Tyrone Ting <warp5tw@gmail.com>, yangyicong@hisilicon.com,
        semen.protsenko@linaro.org, jie.deng@intel.com,
        Patrick Venture <venture@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
        Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Subject: Re: [PATCH v3 08/11] i2c: npcm: Correct register access width
Message-ID: <YjoMpyEmuXHObF1p@latitude>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-9-warp5tw@gmail.com>
 <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
 <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
 <YiDNdlEKqorDFkZB@smile.fi.intel.com>
 <YiJ5unrCb82ZMV4Z@latitude>
 <CAKKbWA4quvDbHWBdckAsKe65fDXXe8M-9CsjaP=4wsA=-NnULA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xEONTgdtFn65elzz"
Content-Disposition: inline
In-Reply-To: <CAKKbWA4quvDbHWBdckAsKe65fDXXe8M-9CsjaP=4wsA=-NnULA@mail.gmail.com>
X-Provags-ID: V03:K1:0rjSZOfEJikFn7A+rHnQNa8z+5/c3I2xEC7rEjobVZzMEAraX6e
 HuMvVgLJ7P7UCggzPmwigflP5I4Y42Hx83j5Wq4SLEmryBl9Q62CsWZ5TVO2lnQ9e4YVuLt
 ce9YVgEYqgx/WHDMUqNy6S2guHkv8SCiC72aUek3IHtIqD2Lo6gY+hqyRGy6/GYZY/8SsCU
 21BsmVI3TAmgW/4gTihZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ClpHcWe8vX0=:FnYR1l8g/xZYeCZXfKUnPC
 ZQ1Jm5fS9cmjKDrj78s7VFpOhu3kBgNos+6ZQguLEF9pHKnSh9+npF2SdI80BXPXR4Di1Z08F
 A11pAz5nZl7/G0IxbtG4eBNDVHMJr8slGm8t/719Lsdwc3P7xKYCO31ExqHApgZYBz8tUFqEf
 mXYly5cDCwimiO9Ny4meh5dfynQ4OjJ53zT3Y76TzNC2h7CFOMyMNCOgmESg0wyAoKwIK7Xqw
 ULrqaLAr3zJuV/wN2VNGK48+Nsx1RNaNbPX/n+8BepsAf0FYm51CAZpelLD9dqfYn1pgm/0tg
 fN7/mNErFnSsfPDIlGI+DY+uaDrXEB48aHwO7PFL8oHsRMgTKSB8/vxHLkShyu0ixa80Ah1AC
 mUTjB7Ep46l9DojTrkHSOIKvCTG24kTmzK12GtvZAay597EKCn+pdCUiqNCxtGDdr8MibGlr1
 liR7qS6Xzx6B7hiBlyuoRQGtIsmkhSW42LXdVPqzFaQeZQ+YFoO5rpqk/ZyNKZ1F9s/krbbt+
 4Imm8dSEfsXTVTDNaJEALxF/uEas5uzTP2BpIVKEmD0EymQkFuqNfXzypVMo47L7N4ITbmML8
 oPFSfLIv0xJMpc3dMBj8r9PWMin7Wa++ManQcf3O/GF/WU/RZMfLHJ5ndxB/i4/U0j11GEIe0
 ATkE0rlYWI0qleAyWQ+tnv+q+RFdUEcVqiv1yCGi2BzcmjU0KuVlN2BdzO3MkPjKuXbpf1uIp
 cT+EFhJejQNm/mljmHEsCEIaUw7lZYOqYPtAaWBJ3N3/rT46ijUNyicrAtvc+I470x6v+pDzp
 BMKuZEfMR430mGMbS+ng1ofWwVz1oy+tdsM+qKSI+sYsvTmGJWY+c2+bSxnGaaKseQQI8/ct2
 Zj8kg9vRi6LoMTwQqcmFeiygjPCjDlvlmOoRt+DQXl064e05wX+NhPPPjxQrNrZOEp39zmCOD
 N+S5rVXt0hWElZmwZoeQmKmon7b/RY0U7Mm+cb34+sYMJw6TcI/nlDcxTLV3hTYPpD5ZCfydF
 K04Vrx1fA5aJNtueyyXXjmIEnivAYonb2LtK4pSM42REOm/YQ0bD5dqMx8koNn3SuKmT/StPn
 Evc2hracwZPBr8=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xEONTgdtFn65elzz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022 at 07:18:34PM +0200, Avi Fishman wrote:
> On Fri, Mar 4, 2022 at 10:42 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
> > Hello,
> >
> > On Thu, Mar 03, 2022 at 04:15:18PM +0200, Andy Shevchenko wrote:
> > > On Thu, Mar 03, 2022 at 02:54:27PM +0200, Tali Perry wrote:
> > > > > On Thu, Mar 03, 2022 at 04:31:38PM +0800, Tyrone Ting wrote:
> > > > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > > > >
> > > > > > Use ioread8 instead of ioread32 to access the SMBnCTL3 register=
 since
> > > > > > the register is only 8-bit wide.
> > > > >
> > > > > > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C contro=
ller driver")
> > > > >
> > > > > No, this is bad commit message, since you have bitwise masks and =
there is
> > > > > nothing to fix from functional point of view. So, why is this a f=
ix?
> > > > >
> > > >
> > > > The next gen of this device is a 64 bit cpu.
> > > > The module is and was 8 bit.
> > > >
> > > > The ioread32 that seemed to work smoothly on a 32 bit machine
> > > > was causing a panic on a 64 bit machine.
> > > > since the module is 8 bit we changed to ioread8.
> > > > This is working both for the 32 and 64 CPUs with no issue.
> > >
> > > Then the commit message is completely wrong here.
> >
> > I disagree: The commit message is perhaps incomplete, but not wrong.
> > The SMBnCTL3 register was specified as 8 bits wide in the datasheets of
> > multiple chip generations, as far as I can tell, but the driver wrongly
> > made a 32-bit access, which just happened not to blow up.
> >
> > So, indeed, "since the register is only 8-bit wide" seems to be a
> > correct claim.
> >
> > > And provide necessary (no need to have noisy commit messages)
> > > bits of the oops to show what's going on
> >
> > I guess it's blowing up now because SMBnCTL3 isn't 32-bit aligned
> > (being at offset 0x0e in the controller).
> >
>=20
> Hi Andy,
> After this clarification can you please acknowledge this specific patch?
> If you think there is a better way to describe this, can you propose one?

To be honest, I think it's probably best to include all the necessary
explanations in the next version of this patch, i.e.:

 - That the register was always defined as 8-bit in the datasheets,
   and so the 32-bit access was always incorrect, but simply didn't
   cause a visible error
 - How the 32-bit access caused an error now, perhaps with a trimmed
   Oops log as Andy suggested


Jonathan

--xEONTgdtFn65elzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmI6DIQACgkQCDBEmo7z
X9s7OQ//X2W94xxyy5YEI/+1O2hIBvmm36jDMTS3z+mAnxmeUKhEBZdn0v8d/euk
JSimNGFJCDze0zmLhJK6yve/1N0Jg0IersKHikjnx06ZU4mgxG5udJKCU2W6MPVj
Zp4IiXgBQ7pTDEMlgEPbT0wSjkmuiiimkjp6QWJZkyKapp3SttzUOiKX/3SeyUtZ
Y1/L3txILtSnYuzlvlL5knG+KJu2Um3/BKCOEzqop+FeQr/16wEvYUWS5Ggg94kK
M9uwBI9cgOhvqS+SOFoNHyPc2VIJ6zsshwz6lB8/NrRQMqrpqyjwZttderEguxNO
MP96a9M7VKpytM+eEbzIZFIxSa/A0zeNqXXXQNB/K+t7Awwdhf32qD4jPRIK0JCK
2pO+hBT5XfRXmRI6f3U7X7lpSpzlR+DMLkq7nEI76rgJfN5qI87ml+WmbzIDXPFf
b04x9eu6AbFeSuz0HW+F/MFwimMiTz+CKVpF7hgZEmJew7OiJT2a1bu6eTPr+4Fv
pOut/60haUWiMulL9QXqbk+0gWWa8k3Mzv6DwQ0wbO/GFHkzlRfBOkMyUUXmNnho
RdBd0cCISHsGLRsRkXEHgCRT67X1sadBrxcB03k91MKNNJoD4mnUr79JpFvIJidC
XL4AOd2HO/z+OFq2y4K14ea8dPl1NgziCcFpC46TAKBrywMDtgg=
=EGzi
-----END PGP SIGNATURE-----

--xEONTgdtFn65elzz--
