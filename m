Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 790234E18FA
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Mar 2022 00:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244351AbiCSXRL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Mar 2022 19:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbiCSXRL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Mar 2022 19:17:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7793A198;
        Sat, 19 Mar 2022 16:15:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E8C9B80A3B;
        Sat, 19 Mar 2022 23:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B130AC340EC;
        Sat, 19 Mar 2022 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647731744;
        bh=IFxZCDwY1ZlKVK/McsyTTEC3rqryBIPTRJjCWhFXaUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oGyunC/tRxa5oQRmeS+erQC1B6Fbtc+FkKLeBCQlFTEnDIlvkg7k5DU85CG37JXv/
         KE5upr4vWIRXJYglJs7MlvsRsn1TMB5Ekwf/Dn1hq70DtwfGOp7uH82wGAt0xTjN7U
         UVCBDUYfS2qMWowIaBpkag8fFO6yB3UsotvDOKEJ8dnYOoKV0gxXH/+nV8yUepVL5d
         aFKYB6vx3xomIw1F4DQWzEIo2S9FI7VxMvdQ0IML874O2S9aFfqfiIWhT3+k4m7Xjo
         Ah7UBfrGi2dXv3y0Wg70wk3PStuj53MKvzaTin7LO1LPP1CZ5zPTrNbsvewq4tvYrf
         LvOALW5H0yMgw==
Date:   Sun, 20 Mar 2022 00:15:34 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Graeme Gregory <quic_ggregory@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: add tracepoints for I2C slave events
Message-ID: <YjZkFrPTW6sR6ATX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jamie Iles <quic_jiles@quicinc.com>,
        Graeme Gregory <quic_ggregory@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220318204133.657568-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eETdPFtlrvLqgiBG"
Content-Disposition: inline
In-Reply-To: <20220318204133.657568-1-quic_jaehyoo@quicinc.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eETdPFtlrvLqgiBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 01:41:33PM -0700, Jae Hyun Yoo wrote:
> I2C slave events tracepoints can be enabled by:
>=20
> 	echo 1 > /sys/kernel/tracing/events/i2c_slave/enable
>=20
> and logs in /sys/kernel/tracing/trace will look like:
>=20
> 	... i2c_slave: i2c-0 a=3D010 ret=3D0 WR_REQ []
> 	... i2c_slave: i2c-0 a=3D010 ret=3D0 WR_RCV [02]
> 	... i2c_slave: i2c-0 a=3D010 ret=3D0 WR_RCV [0c]
> 	... i2c_slave: i2c-0 a=3D010 ret=3D0   STOP []
> 	... i2c_slave: i2c-0 a=3D010 ret=3D0 RD_REQ [04]
> 	... i2c_slave: i2c-0 a=3D010 ret=3D0 RD_PRO [b4]
> 	... i2c_slave: i2c-0 a=3D010 ret=3D0  STOP []
>=20
> formatted as:
>=20
> 	i2c-<adapter_nr>
> 	a=3D<addr>
> 	ret=3D<ret>	<- callback return value
> 	<event>
> 	[<data>]
>=20
> trace printings can be selected by adding a filter like:
>=20
> 	echo adapter_nr=3D=3D1 >/sys/kernel/tracing/events/i2c_slave/filter
>=20
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Applied to for-next, thanks!


--eETdPFtlrvLqgiBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI2ZBIACgkQFA3kzBSg
KbbZeRAAmR6eAVN3lFkHcekhn1380YxReKaRNd7uBP3TPyQ1SLRQ5S42zraw43XE
e/JA5FIl56UX75Wi7AalXD8i6ZTgRmbfmyrlr1IcwE0syHdKxbJTW/Brhex87MJl
bpOAlfQx3NjtUZQAwFXlj2CxMWqUvAFPXvDgcr9s7iDk1r/kgwbreSYIveicuF7C
/eg8aIAJ3hG/LcqyqzM9GAQfYOp6yp8aNAhAF0AEQMlHwNQRhmWMCq+M+mCHHFq4
TV48FQBMWPtNKGdkyN+XaHiNm20Up5RlAzixJ30/pW7Hrzu5Vo+EWkXTTbIv5GrS
qqnZNg8vF73vco0wo0Kx+TSD7HXF1lKvZi4lfPCWzmJ13NMrjfv6hXuhAvI50U2+
kd/PP9CcNayLIeADyl+h/KesEoAUAZfO67wlLkaLTRnoCUrqIeqCClDws4NsPHtD
22Vt4l+o4wYMp+2P5G/wi/a8EutivZIUQuZlFbQqzl/4F+KdXrkWgovrzS0yplFt
CWtTJXB9gmdv+PT4tLRDr3cQjyiKdMTDuRRsrAffYDBL2A0ZLYN6SHH9+h01dKw3
p4yLNrKbARoqd8XMWO3DRlfJwqKpEelUEy8+Ti1q7YKu8BqXJIIAu9FE80QVR0nM
sEO8ozlyfZV8vJtwAaxFkWCWI1daY7xOAHL66cO/gcUENYoYagE=
=oaPP
-----END PGP SIGNATURE-----

--eETdPFtlrvLqgiBG--
