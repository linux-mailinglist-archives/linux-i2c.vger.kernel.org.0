Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E279B527E52
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 09:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238743AbiEPHMY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 03:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240885AbiEPHMP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 03:12:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F147AE005;
        Mon, 16 May 2022 00:12:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8EF656111F;
        Mon, 16 May 2022 07:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65801C385AA;
        Mon, 16 May 2022 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652685134;
        bh=T1vV/Ux67q2avEeEcOr2htPnM5drwM/ViH3a7x44/EI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AavVg5CLFTswHl62RuKVzFsnRAaCfJOGRG6G6FBKpnxbkzE0yV7qDZKLhR522zWGr
         YUmrT17NsCK32kWhDMR7dT3NyKFkIB+hSBU+c3+plkp6juGZDUNsnkxxrjU0orw+LZ
         XQBrltcO/PQVo4SpMKwblsreOr0lWBnWAirBwJorU6gM1c/a9l06kCTWlAdEJMGkh8
         /ywd1UsEi8FSSLwFOxqEBgSMxOfBfKCSEr0fsUJruDCa5VD+ZlJN4wuQUYw0USc/hJ
         iGqPGGLyD0xivf/yUZ7Nv9E5CdhrTzKdkmdf7yFdfhp4s66hVLklP1y3VccTcfNm32
         oS5rcYLY3wRcA==
Date:   Mon, 16 May 2022 09:12:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     kernel@axis.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add property to avoid device
 detection
Message-ID: <YoH5RxVxgAc8IQVn@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>, kernel@axis.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
 <20220412085046.1110127-2-vincent.whitchurch@axis.com>
 <Yn+8CJ3j2SY2+Mq+@shikoro>
 <20220516064338.GA28916@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qF9DPI2fnXDQVbtE"
Content-Disposition: inline
In-Reply-To: <20220516064338.GA28916@axis.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qF9DPI2fnXDQVbtE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > That aside, I am not sure we should handle this at DT level. Maybe we
> > should better change the GPIO driver to not populate a class if we have
> > a firmware node?
>=20
> Is it always safe to not do this detection if we have a firmware node?
> Then maybe the core could just always skip it in that case without
> looking for a special property or requiring individual drivers to choose
> what to do?

Need to think about it. Could be argued. So far, setting .class
correctly was the job of the driver.


--qF9DPI2fnXDQVbtE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKB+UMACgkQFA3kzBSg
KbbOpg/+K0cFL3dSg5yOd9GEjx9wQcSECtRc9dEt6zJtgSUgTsGuHnmdTtsNdtod
j2tMHYujqiukm9nc7eO0uuYFzeO2ZNJL/MrqeQek9dSTTyclIGBRSjtDCuv8A9u9
OlPfflJLGKyGJQR3lMkQeoCoB95sgKs0PxwqlwaLHNHV2SWJzXuZhqoYsd1m1MS6
HqBdc9fTqZQ58N883603gdoLONzEarLjBzusCQBRxnIVwVdBM1dTvuSGg1qcpsg7
kx4Rfrcm2ZYoWbMpEnji2Ok2V4GLEexTRuUZuGQ9hpLttbJSG2yxJ51Tl7rPwNVt
YND/t2/A8+smK9xTryuuwiujBmE6vS2G0DfuwPCZsGPqX0hA5duJAoC3WsyaPazO
z8+y259b1p5L2FzKp9AflHc6iSv0vs/MkKntYRd5sIWnlAGCttCqx0PpemtAJp8J
kX804WWd/cXFEzT+BcCL+HsYU0BmsWqAqPb4Rm5nRKzkpcBUOD9+duvuOiSrCf6C
mettHVlD0EwjQsc/ew+dIkLiLjjPVmVD28FcwBCMl0G3sKRNUqeHUqpfkEx9n0lU
qQzQSqvq26zC69uERWFIEl52q0qzTYgQKP4Wus1NZzvkJ+mHCB5uGNK2fOaUUgWC
0HP48p/+oRuj2qbwoV+65S4KpJJ+3FAftw26JmaDJ8DD5Yv021o=
=5uTH
-----END PGP SIGNATURE-----

--qF9DPI2fnXDQVbtE--
