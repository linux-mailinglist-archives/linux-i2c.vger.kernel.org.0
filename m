Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB04230FE6
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 18:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731459AbgG1Qgg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 12:36:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:51722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731429AbgG1Qge (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 12:36:34 -0400
Received: from localhost (p54b330d0.dip0.t-ipconnect.de [84.179.48.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E2C12053B;
        Tue, 28 Jul 2020 16:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595954194;
        bh=R+lWAAOOcTMEDROa6z+bH02XXKHWfd7l285szcMZyhU=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=2HMYvmDafPDfD8NURQaaLGvzGhofBfjY1aQ8Tpq1DFR2ol8IEPSYiJUmgLrhOoea0
         knzeBEJ7FpR7fHD9MNLMZkPcchEFeAABCpvWi+ijmIAKkgWIhs6iJmf/YZntEzixw+
         quyAR8rxU560a5lXGwiscGuLh3tHuREB3NdCc4O0=
Date:   Tue, 28 Jul 2020 18:36:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 1/2] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200728163631.GF3736@ninjato>
References: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
 <1593776168-17867-2-git-send-email-alain.volmat@st.com>
 <20200725202733.GA946@kunai>
 <20200728121050.GC8715@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Content-Disposition: inline
In-Reply-To: <20200728121050.GC8715@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alain,

> I've taken your comments and prepared a new serie including them.
> I'll wait for the conclusion regarding the bindings before pushing it.

Thanks! I hope we can finish the discussion this week because Linus
hasn't made a clear statement if there will be an rc8. But I still think
we can do HostNotify for v5.9.

> I also have an additional patch ready in order to add again the SMBus Alert
> support within the stm32f7 driver since it has been removed from the
> current serie. Hopefully I can push it once binding is acked so that it
> can get merged also in this cycle.

If it is super straight-forward, then yes.


--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8gVA8ACgkQFA3kzBSg
KbajSQ//dtaGNmyVGvsfuixW64jisjDGJgBUd+WZi4edEMhsqQuB1WrNXRYMJ96W
vq11wHJRWoYDXGGaUeGMsRe88yjr6eMamChYLb7OXqQjMaBFr2oq/wgqH0EVPdI4
M1rg1keqTkTuvnYnKXW6bq5U0DaygeXmi3NOuvX2CCWGcfrDJm69NTDLo1xtKyia
ZNdlyCdWBETFEC95Wli1PpdLPHD0NctsA0BtEGQLAutI0T0TrSVTj2oH55S2ZNOm
cEIAjHhb2S8S5R/H9+JPLF9DMRn6QRTg2jYaEDy7vd6XxkHn7SWPSyMT41xEq/0T
PQ9OkRkpyY2vJ8r/XaaD16okW1bPEmxW/1RxOcVmuFwtsST9Xu5ovMqesQO8+XsG
DHSfAIO97GKaZ5sYTHd/pW5UZ2GW5okSDXzPBIoDSA8AFWEMSrhZ6Gh9kMwvUY4H
Szj095Q82lbV4A2uZHlp8Or9x8roiHKTX9opJy/gmh4X1wcZ/iFkLjInwC8bf9SJ
ldK/4k/7LGPB0Zc60v/mCjkG3QCZXW05JvwkI1dnMyNzZzwhMSnWIsiIaC9I4w+V
Bjta6GG92S/nx2SmfAEG7SILinq2mVU3iielHg2E+YlqptIWSwz9XGGqLMYHNL4O
J0Xef9hK4m/VmjA+QyRHyqfFXJ2LxCnL22d/cgLex1WEi/M8hjg=
=A1LF
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--
