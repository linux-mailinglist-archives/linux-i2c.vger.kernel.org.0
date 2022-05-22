Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB4253060F
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 23:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235763AbiEVVFn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 17:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbiEVVFk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 17:05:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18A03A184;
        Sun, 22 May 2022 14:05:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9D7EEB80DEA;
        Sun, 22 May 2022 21:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7476BC385B8;
        Sun, 22 May 2022 21:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653253536;
        bh=QqkmCiv7MnCoMKXwXQyvqnhD5Nl4Qpma+MkMz/nTaJU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U9KsHlGSORB966e/FhvViohw7osRrOPn6/UpYtAIFFSepsEsJWw7TnqciJGMf0NPX
         mcUnBnTjNRp01L/OoVpRpdqjR6FbIr1I/7WKVJAtNovvoRPu7deO9Nhfq2wBIncYOE
         7SpYy7SiLe0I9WdBE0nK5+79jl/mNBH42Z66Gpujpn29Vyg7UVHLsm0UtiBgehbS0q
         REkPCQggppapj57wzGbFYIUXAEME2RXtslT0dDJPgM6tGZQMMkyuUyOGmP7ElXLSk0
         XD95BopwOLoelfxu1Ye/zIC5O25est9iVLRUZmiJvHudRKPk5S0Af33x25Y2yXZI9S
         XP8jsMWt9dZFA==
Date:   Sun, 22 May 2022 23:05:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     zhaoxiao <zhaoxiao@uniontech.com>
Cc:     f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        nsaenz@kernel.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: bcm2835: Use platform_get_irq() to get the interrupt
Message-ID: <Yoqlm74Megbsjhf9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        zhaoxiao <zhaoxiao@uniontech.com>, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com, nsaenz@kernel.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220210092506.21251-1-zhaoxiao@uniontech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v5lSvTAVM/B/Om3D"
Content-Disposition: inline
In-Reply-To: <20220210092506.21251-1-zhaoxiao@uniontech.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--v5lSvTAVM/B/Om3D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 05:25:06PM +0800, zhaoxiao wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypassed the hierarchical setup and messed up the
> irq chaining.
>=20
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
>=20
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Already fixed upstream 6 months ago with

c3b2f911ac11 ("i2c: bcm2835: Use platform_get_irq() to get the interrupt")



--v5lSvTAVM/B/Om3D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKKpZsACgkQFA3kzBSg
KbaHGw/+IXLJBq90m5oAUg1frzyQ7WTWctHABhr7/hUZE49ls58M/TfxNvhw2VYW
EaiKJA/2iZOLwwbSd3gYxxFZILfgns3PVCU9cVsQ+VrHq0H+q5ro75JtiwRBkoj4
JA+rUA2Zrky9xbCQ8unRz6GJJc3grpb6+l71ljNhSgzKywSTGgG77LYbYM0rWP1Q
xt6PnobPqpNrzG5sVAsf4DqGiK3cqPsK21oeP+BS3GgbBHlg+0+hwUccySd8+c23
X63pOrJgEIj9LCwiBiiEmkRysSrCYV4Wsicl9hdgR1HIYNtrnmkM/r+5VFe2vQLx
WIjLRtlHOD3TC/iPY4OQ4uegU5GgJJST/ww4d8ggi+lyAmTG15GjSPAjDIFB4u+e
2tivjsGrcBuw1yl4p/nmDvdN3G5SvJeWQ37Vw7zMCbyFBTVHc6MtnfSE6W0f3Izt
BWEpzY4VeiEDZipbbRLFJrTx/9ZXgTTBVPWU+/oR11QjsFQS0q+0n389CL3Mx4mQ
Op7rt9jxevcERwndzHeYMGjX2Iqp+cE05Lrk+PF3hwA4dBtFJW1TWKNIf0J9wGb5
tnZRqGIYSQVIx9o9ePIl/j+Xm6PwyyxzmUEY24/GqzPZT6eRfyGwsjk4AdmK9f+Z
sPUJWp0NkYMDDbVWLWmuWM2eOBTO88r64eupPmKFFelVKPAdD4Q=
=/CwU
-----END PGP SIGNATURE-----

--v5lSvTAVM/B/Om3D--
