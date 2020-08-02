Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41626235A2B
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Aug 2020 21:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgHBTP1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Aug 2020 15:15:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:37330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725910AbgHBTP0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Aug 2020 15:15:26 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A17FD206F6;
        Sun,  2 Aug 2020 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596395726;
        bh=XV4TUblKrr0Hr8yACYDhNcq4dzFvBlBYUya/0bgDY3g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hiGYbBCxgOHie81Y9BqP0nD+nhAU0gexTycJoQIOe9fBkQ9B1OeKPfyYIBZ6wIKZb
         wPH+gwvZXU6j5Ql7JtG0OgrjYqFMOJp+R1v6YaE2rvN+/KU9dqhjNNRG29naT+w0a3
         /7wWik4Y1pmXqbCACeHsgkCX58I8rnIePGo5dIdY=
Date:   Sun, 2 Aug 2020 21:15:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 1/2] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200802191523.GA13339@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
References: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
 <1593776168-17867-2-git-send-email-alain.volmat@st.com>
 <20200725202733.GA946@kunai>
 <20200728121050.GC8715@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20200728121050.GC8715@gnbcxd0016.gnb.st.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I've simplified the index handling as you suggested. The only impact is t=
hat
> finally we do not consider anymore the I2C_SLAVE_WRITE_REQUESTED event as=
 the
> beginning of the transaction since we don't perform the "reset" of the
> handling upon this event.

One more comment on this one because I had to update the testunit, too.
To be robust against multiple write messages in one transfer, we need to
reset both, after STOP and when I2C_SLAVE_WRITE_REQUESTED. See here:

 96         case I2C_SLAVE_STOP:
 97                 if (tu->reg_idx =3D=3D TU_NUM_REGS)
 98                         queue_delayed_work(system_long_wq, &tu->worker,
 99                                            msecs_to_jiffies(100 * tu->r=
egs[TU_REG_DELAY]));
100                 fallthrough;
101=20
102         case I2C_SLAVE_WRITE_REQUESTED:
103                 tu->reg_idx =3D 0;
104                 break;

As you see, I used 'fallthrough' to avoid code duplication and that only
one reset part will be updated.

Dunno if you really need it, too, as I haven't seen your latest code yet.


--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8nEMcACgkQFA3kzBSg
KbZqlA//YcdWQrdMtZVkEa0j7XyFwCOfHaTqDGUYviawbW4c0CEa9xBj3EEr+xKa
Loo+BQtokIFmEDGxJfCKbhkPRS16I5jf/FWSSRgmARA1FLVaD1PJE32XVr8UcDLv
c/LH1xgRG0+xq1DbvCwIxoUiNRtTWuGfec3JiS6uotPdRfiJWbgw9IZJAZXfclm/
h0I9rWzO5jl5UTLZwtcZyqmV0p/os3MvGvlq9wkmLDwlVpvUgltu7inBtKJyREKC
w95OaduiRX0ogJftW7VnR+dTryUamMM2SrhMMGyC7fn+6spJrD8N/NCQfGmQFOxm
CU8ZxKN/8OtRxlDu1RlMSDhmpHvBLxztWUD6Z1VNgoqoTLUIpuowl2TKPV3uGymh
HgjBU8jUddL63dtSgXnxxoLoskut8BbmRLJukLSj2Vto5Qq9W8r6U5R1neMoFhi+
R6RhaNWL+n4+eDSF8j46o2ClUTiW2EW9pe+0QrLYGjZPaHkzkDLhtv+pYyeuRnug
fn6PB28S7CHekraTIpY2/7gOFS550TUEik3TPhF/dGvKrNA5tV9/tvIHRycckBiq
vvrISspAP57Dpm6Sw2XLQyd/C/39LLwplnWruVmxfDL3gLynoOR54y5UCqftEz9Y
zvoUfNjQa4m7EVPOiJBLe71dEakwA3ZvDGOnhzcPyWA4iPNsovY=
=ABxQ
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
