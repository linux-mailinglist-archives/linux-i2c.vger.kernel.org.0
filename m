Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 678F656B39
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfFZNuc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:50:32 -0400
Received: from sauhun.de ([88.99.104.3]:56460 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727428AbfFZNub (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:50:31 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id 213A42C0114;
        Wed, 26 Jun 2019 15:50:30 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:50:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabrice Gasnier <fabrice.gasnier@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c-stm32: document optional dmas
Message-ID: <20190626135029.GO801@ninjato>
References: <1559655253-27008-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="keoAwTxaagou87Dg"
Content-Disposition: inline
In-Reply-To: <1559655253-27008-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--keoAwTxaagou87Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 03:34:13PM +0200, Fabrice Gasnier wrote:
> Add missing documentation for "dmas" and "dma-names" properties that can =
be
> used on i2c-stm32.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Maintainers?

> ---
>  Documentation/devicetree/bindings/i2c/i2c-stm32.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-stm32.txt b/Docume=
ntation/devicetree/bindings/i2c/i2c-stm32.txt
> index f334738..ce3df2ff 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-stm32.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-stm32.txt
> @@ -21,6 +21,8 @@ Optional properties:
>    100000 and 400000.
>    For STM32F7, STM32H7 and STM32MP1 SoCs, Standard-mode, Fast-mode and F=
ast-mode
>    Plus are supported, possible values are 100000, 400000 and 1000000.
> +- dmas: List of phandles to rx and tx DMA channels. Refer to stm32-dma.t=
xt.
> +- dma-names: List of dma names. Valid names are: "rx" and "tx".
>  - i2c-scl-rising-time-ns: I2C SCL Rising time for the board (default: 25)
>    For STM32F7, STM32H7 and STM32MP1 only.
>  - i2c-scl-falling-time-ns: I2C SCL Falling time for the board (default: =
10)
> --=20
> 2.7.4
>=20

--keoAwTxaagou87Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TeCUACgkQFA3kzBSg
KbYAzRAApZytjukntjxaFMm+so69LjERp5Yg3pQwCd5U0L3E3OjLo5dsPhuffoi8
je+cHGsEMB7A8KV48HJ581rmyC/elLIsJ+rr39tLbiyUMvWrabTLB4BvFPq1FKRR
ZTavWSA01Z+q6BTcrEynX6woY/SYD3WeES+sC+fILuqp1sY6t/RtSLPfT7Y657+g
PU0AlBy/Z3reWy9pQVUWe93UHuEI4KP3MJXuEiRylCUq7FSip2BdMnVyEY7QIrCJ
z9o1MeJ4BJD402tJI++NTPX4uxbkqCsIq1OaQkxn/lWcirCy8oL23oN7YAOzPMSw
5akc4UgfiBeE5lxSyapgnUe2Bd4zPI1epSbiQpPCt5mWTRac3MhUko4YcjCTq6Lm
i2RgCsQre1/B4ZBUOeD1A9atsqVsJvYj+X9sJW+9C/AWRT0VrIYlc0OVHZpIJO1L
M2o0LQFeQdaSfcH/2xmVFAXilcUQYHi8AWb7X0awvBY65XeDA+Khl7cvQQ3lA+kL
oJyQy0W52P6piSns80Ho+F77uGqJvKwca9GxFmNs6kM+21Ipfxux8NXaMeCWUEjR
O1BUWFFumbh7VS4BN5pGsFJ6VWt9vrQe4ko37UkkLGkzNXvq2X6+OSAwQqLkiYTv
MmykLVk1yMcVJAKSny8k/bjJKE5ushPTIINoUA6LiGxgBby4+TQ=
=uE1/
-----END PGP SIGNATURE-----

--keoAwTxaagou87Dg--
