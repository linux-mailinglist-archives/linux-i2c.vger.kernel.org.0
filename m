Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51A5718492B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 15:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgCMOVO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 10:21:14 -0400
Received: from sauhun.de ([88.99.104.3]:52342 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726632AbgCMOVO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Mar 2020 10:21:14 -0400
Received: from localhost (p54B3314F.dip0.t-ipconnect.de [84.179.49.79])
        by pokefinder.org (Postfix) with ESMTPSA id 0511F2C1ED4;
        Fri, 13 Mar 2020 15:21:12 +0100 (CET)
Date:   Fri, 13 Mar 2020 15:21:12 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 1/3] i2c: qcom-geni: Let firmware specify irq trigger
 flags
Message-ID: <20200313142112.GC1852@ninjato>
References: <20200310154358.39367-1-swboyd@chromium.org>
 <20200310154358.39367-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline
In-Reply-To: <20200310154358.39367-2-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 08:43:56AM -0700, Stephen Boyd wrote:
> We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
> should take care of this for us. Just use 0 instead so that we use the
> flags from the firmware. Also, remove specify dev_name() for the irq
> name so that we can get better information in /proc/interrupts about
> which device is generating interrupts.
>=20
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Applied to for-next, thanks!


--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5rltgACgkQFA3kzBSg
KbajIxAAiqJVBYQB8zlv9us/5AbFQZ2APbIdeuxr0PtHfTi5LFEppMyOhmWMlESq
cIlKMiXrlS7kQk7p2xA2UPBQUvlvlenTYXCEq/4vF0jqEbG46t+V+TC+9uyqI0QZ
fP9m4BNdnbC1/0riFBxTyrORNfjxCsHD3EMKO6uzMl/vt4z1hu56EOYlmr6OOn9T
RkTrlijgdkv8+wBfZ0W50EQGnXeAVZvkotXH64mqq3PaP19ujQOU7+gam9E8C++/
Y8WJA7YTIaBCN8CJe89EBpoq5+nTX/3kPnmos0t9pR9h64EORuc7yxjXUmrBqyio
zcivVxHyNzdr+7lliVrfK3PinAwnaO093JyEPxsRvzvt8pwcERJNV6YNpR4RDDTj
iNR2BvuaNPvDk1uhVWB8UOxkj5dOVjRt48LMHELlTSxefnMc1jYuetx2N4ugYAu1
2h/dZb4rEo0O7fj57H2F/zwVelSJyUsoJ3uoSAYdshoaKkCkMovwnf6J3svVgwoP
U1JyYS6Fgz+aOxErK3TmjdUXOXfYDFRr3K04hudwUhdyLyJfBHqG7lQ+/EDMb4Qu
/W5OahDXEGy8SjVjoS80sw0quCTtWxfuqzWwGd2v4qq2+KaM98ZcvJszrMPBe24j
TohLXhpf8tdW5Gv+jCQ5HE3EppcesDh/mBYk+tqAjW2E0D8TpTI=
=mlys
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
