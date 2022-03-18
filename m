Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C1F4DD87C
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 11:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235457AbiCRKzN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 06:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235441AbiCRKzM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 06:55:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB9617157C;
        Fri, 18 Mar 2022 03:53:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F5AD614F0;
        Fri, 18 Mar 2022 10:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680A2C340E8;
        Fri, 18 Mar 2022 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647600833;
        bh=Ka134EcpD/pAKg03HVpWxkVbFlnaUkIgiy7ozVY+d7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lWxwwL4fmDQkBireSEgwI6RPLJMy2t50xMGZ/rs1uKQwU8kSkzEkpLMA/0ZeoIwcD
         ccwqFbCXPntjLziwvplJKY/E+0TY1ZS8qlSf0AZevWvqulKZs0Nl9Fhc14pRzqan9f
         Q1qGt4BWm3LzbM+U03L5j3+HD+fYhGlFhrIQmEcI/XBXd6kurQ0UnkbVbsM1oI01g0
         BzPFGKyesh9phZFmsOYwIW1VvFbO8NB1i2/8XyLtB5AT/BOpozVaKxfaCjYY00sJtw
         uo5Q8jrZzNn05EEn4xARAnyj5DTxDEuc0iUpOj4mdcLdFKOPxbXmjN18Is8/zKyRkH
         9c7svTiMwfcPw==
Date:   Fri, 18 Mar 2022 11:53:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Graeme Gregory <quic_ggregory@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: add tracepoints for I2C slave events
Message-ID: <YjRkvPc9uahbozbQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jamie Iles <quic_jiles@quicinc.com>,
        Graeme Gregory <quic_ggregory@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220308163333.3985974-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rqHRRJko+wIyNI/C"
Content-Disposition: inline
In-Reply-To: <20220308163333.3985974-1-quic_jaehyoo@quicinc.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rqHRRJko+wIyNI/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 08, 2022 at 08:33:33AM -0800, Jae Hyun Yoo wrote:
> I2C slave events tracepoints can be enabled by:
>=20
> 	echo 1 > /sys/kernel/tracing/events/i2c_slave/enable
>=20
> and logs in /sys/kernel/tracing/trace will look like:
>=20
> 	... i2c_slave: i2c-0 a=3D010 WR_REQ []
> 	... i2c_slave: i2c-0 a=3D010 WR_RCV [02]
> 	... i2c_slave: i2c-0 a=3D010 WR_RCV [0c]
> 	... i2c_slave: i2c-0 a=3D010   STOP []
> 	... i2c_slave: i2c-0 a=3D010 RD_REQ [04]
> 	... i2c_slave: i2c-0 a=3D010 RD_PRO [b4]
> 	... i2c_slave: i2c-0 a=3D010   STOP []
>=20
> formatted as:
>=20
> 	i2c-<adapter-nr>
> 	a=3D<addr>
> 	<event>
> 	[<data>]
>=20
> trace printings can be selected by adding a filter like:
>=20
> 	echo adapter_nr=3D=3D1 >/sys/kernel/tracing/events/i2c_slave/filter
>=20
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Steven, are you happy with the tracepoint parts of this patch?


> +	if (trace_i2c_slave_enabled() && !ret)
> +		trace_i2c_slave(client, event, val);

Why '!ret'? I think we should always print 'ret' in the trace as well.
Backends are allowed to send errnos on WRITE_RECEIVED to NACK the
reception of a byte. This is useful information, too, or?

Rest looks good to me.

Thanks,

   Wolfram


--rqHRRJko+wIyNI/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0ZLwACgkQFA3kzBSg
KbaU0xAAiJLhpuUxibhFyVl14QQR4Qh1XvhM6rcLT6jWqrp0cGOWeIg0aTXm+NPV
FY20MyoM8Upmgg1gr1R4wh0M2ShDau2IOHhMEQtAvXwvUtkmAUxdtvIOI6difKse
m8JbV4AfiWHQTvkcwr0zlbJg58tqGUmPiBzvXsTARthrCida24i9uLFQWFHoqBGX
E9463fdGmdzbuJojfRlQ601LPNTqwNpFNiZpg97J/CY+L8iVKQqvMfYWQ78d3Cze
g57NqWIMZAyCQSxhgdjBBsW87bbD/Qo5eQAmD/M6E96sClo+ZcYEtFqPiE0cPkMm
C+x3e4jW9nxS9YHcYbfGb0bXOjJ6VhQMNDd64f3uEvghI12P9NAqjXnQ5VgoXw8Z
99GD2NlJkoHPK4qvbj+aaf4QEwYctldE9NGtpMFWzgowgUu3vIZyWfcWDUIAXyk7
4+F9xmjcOqpUAR46o2w8POd5AfhI3WU5DsR/7nSRKqrkapYD2oCYq8k0Lvj1ZskT
1CwJSNZ1jvS2ipsFLVsvRDFJUrPSN/iu2Xs903v+bOSnCLj3HBMqbkNWY3cXPXpq
WrnKdVBXFb7/uWb3pysgYutrAIRUpdZgAmzE3SyzbnBudpNzj8QnZkJuh/ozDGhM
Vq5s+ELhxFx/G1HWeDwkRnucRJJIHuXP7T5XCKVkAggywYbXORk=
=PJ2T
-----END PGP SIGNATURE-----

--rqHRRJko+wIyNI/C--
