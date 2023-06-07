Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF10725BAC
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 12:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238175AbjFGKeh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 06:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbjFGKeg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 06:34:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD976EA;
        Wed,  7 Jun 2023 03:34:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3831C62DEF;
        Wed,  7 Jun 2023 10:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1670BC433D2;
        Wed,  7 Jun 2023 10:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686134074;
        bh=EnWyL/RGZVIPRednPxgadT7R3he2GlukPWhgaMHT7gw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hd0GZexWOXSaSGDZT9lqrMXsp4ss4me/8CSkbFA0Zl09kEn295vV5t7omARWN+yF+
         TNjYnTS4TbdjxxFVdTrzdep/OEfveLzAbfuIXw9aGcuxe4a8Xr4KOSKNnQ7hTRlhk5
         0seKiKVRAPQuOurxVu24CUrVKUJswMa0fKyN2OKcKEA/5AzxB9uQujexZFbjYbkNXP
         XxgQw4i0h0xHQIgo42//4c1o80Mrr6hdpfEcff5ccSScHpuqIFX7qahwIAPUhvg7bM
         Yox5OQKitnZTFGtVhOaAxhmztxyYADhZ8cW/pg+aIxQLrAfJv7Ecf4ZPtLXO06CfHM
         NSWYZNiTSfxYg==
Date:   Wed, 7 Jun 2023 12:34:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Md Sadre Alam <quic_mdalam@quicinc.com>
Cc:     loic.poulain@linaro.org, rfoss@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_sjaganat@quicinc.com,
        quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 3/5] i2c: qcom-cci:Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <ZIBdN/16vizJqNZp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Md Sadre Alam <quic_mdalam@quicinc.com>, loic.poulain@linaro.org,
        rfoss@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20230306144522.15699-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bsZdphsPPiw7WIHD"
Content-Disposition: inline
In-Reply-To: <20230306144522.15699-1-quic_mdalam@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bsZdphsPPiw7WIHD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 08:15:22PM +0530, Md Sadre Alam wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Loic, Robert, do you agree with this patch?


--bsZdphsPPiw7WIHD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSAXTcACgkQFA3kzBSg
KbarcQ//Y+9HmY6t53QDwVMuvc4Z8203aKAUdHggYnJ6n5kwNoCcutIFR8+/AYIT
rz5uytUYJg956cMgaqSk8eAJJTZf+/8JOyWIWkawDEwG710RDjDj1+ULYGe1h77U
o7a52fRi+88AMG7V2COvq3umsxVKecjyMQtJ7ysTR+Up0vaLF0Nq7p/nvM2l583o
h/VwWxwrd8NbPIzaEAlczrQPJXwxQymkNK2QQm3x0tWxZXm6ZzYAzduKpRMX3JXT
+g/n5obKYtqDl/GCB+vMzzoDh/144H34KTZYZN6IpQeuTkh/nJMp6xdGJ6pfZRc5
TtKzvrHreKu6pYVxuxCzkbOzt56knibv/EDpFlF3ckzW9SC3AIPAjHkBV+70ChMh
kgVuk9z6zlI2h8BykYQHF46SJTdZS03msfHg+ROXgkeffMt0JV0gZCYYnP3ZB6y6
2oI4/gd3W4h+IWQxAFhfGFLVheLIDnnuamb5F/cXPwzfv0oSXNblkD2uSif5uOxh
X3D4FyjJ0G2P5xkcjpvMLYqGRFfdVDW9lW/wTK5vICXBywjGCZhMqEIQYjgGgJaV
7h4NEscOfSmqkRbE2DMEBN+z/Nzf8tIUPSixf1j0CgwLVZFGbvnwLJEn4tgNu0zP
rPSNx3VxXEH/Miu7qFbF8o8VWt43H4otn5AIbj8gh4mjvdbhZqo=
=83z4
-----END PGP SIGNATURE-----

--bsZdphsPPiw7WIHD--
