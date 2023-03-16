Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9856C6BD9D3
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 21:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjCPUHG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 16:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCPUHE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 16:07:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73FF580F1
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 13:06:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9B02BB82336
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 20:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C7DC433EF;
        Thu, 16 Mar 2023 20:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678997217;
        bh=O2K/3oOoV+bfuueDyilmD6J+7IZkwz7szb1dI3Ns8Hc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q0rucp75fSA0vlEhelzXdReirARFFP3ORX4mwyNbTQcHwsHyEFOAq9Y6PpUwdR0b3
         3/0rLSIRbbxNr6mpDz8mIVKEBkJLGf+Y/VZZNihAr2ZJdsNLvW60c3O+QctJeF8SYb
         kIglOYaqaER8BR6UANIheD21b3bxc2eYuARnOC0luAl+EGoMF/OKvSnY0qEwpZugZL
         oQhOuH9e4OqJMAcTZ3cBKptc49iX4XBbJhrN5/gxwCIJcUG6Dtkajl5/Sqv858ZaRL
         YNW+MPbWKHL/ZYUOQWgZhsMDcCtFu40xiWeYsJYmqdM5muOuuza5bCe57wkxGtxNWE
         eDtanOcuSQ0pw==
Date:   Thu, 16 Mar 2023 21:06:53 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@huawei.com>
Cc:     linux-i2c@vger.kernel.org, chenweilong@huawei.com,
        f.fangjian@huawei.com, linuxarm@huawei.com, prime.zeng@huawei.com,
        yangyicong@hisilicon.com, Sheng Feng <fengsheng5@huawei.com>
Subject: Re: [PATCH 2/2] i2c: hisi: Only use the completion interrupt to
 finish the transfer
Message-ID: <ZBN23VqLFzGyMn2U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@huawei.com>, linux-i2c@vger.kernel.org,
        chenweilong@huawei.com, f.fangjian@huawei.com, linuxarm@huawei.com,
        prime.zeng@huawei.com, yangyicong@hisilicon.com,
        Sheng Feng <fengsheng5@huawei.com>
References: <20230313074552.54457-1-yangyicong@huawei.com>
 <20230313074552.54457-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKs8a1DayUGWqD8h"
Content-Disposition: inline
In-Reply-To: <20230313074552.54457-3-yangyicong@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gKs8a1DayUGWqD8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 03:45:52PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
>=20
> The controller will always generate a completion interrupt when the
> transfer is finished normally or not. Currently we use either error or
> completion interrupt to finish, this may result the completion
> interrupt unhandled and corrupt the next transfer, especially at low
> speed mode. Since on error case, the error interrupt will come first
> then is the completion interrupt. So only use the completion interrupt
> to finish the whole transfer process.
>=20
> Fixes: d62fbdb99a85 ("i2c: add support for HiSilicon I2C controller")
> Reported-by: Sheng Feng <fengsheng5@huawei.com>
> Signed-off-by: Sheng Feng <fengsheng5@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Applied to for-current, thanks!


--gKs8a1DayUGWqD8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTdt0ACgkQFA3kzBSg
KbYJgA/6A+/yVvg1aLdj2ZwEVKxMgMcyGP4x6o7x/JDFCvr2HSmlTszk5zCBuMoU
rPVB6KW3G7kYfNC7XSypEVIVszwYA0jfzcYuLjP+F6wXemY6ZwsfECLdhAJ1WPp2
E9/Vmno9/Qy3FdSW6phEuXn4m2X4TBXjhS+WRu2XyCrYxtItYX1gS2eyRx10w/Ld
ocdo4tCMP244dDmhrOKwpFGr0rykoGoFAQYjaL4pDI1nHeVNCKaDItAujhChFm6r
TweMWItQWXJMJfOYFTSSrZi2tgMBMiiWnJpjvInDBD+FPYZqUavLa+6lD3E/6c22
EzZFP1riH4+tBBer+bvXkRNHFItadAV2Gv7P1bFMI3HuMffZYRvm8aezv90nWWp2
PTUCaA+OC4O+m7ui7fwyBWzft1aFGyIbOvypysbA+pidHS3R84T1xT9E++fESgOY
grjvhahrkyFti5oepwD3k4FWe9+zIQe/fnl1C9mmoxJpa7hIgmhqZibykmp5ywBL
Dwvofq5iirCaWslIXC2prQ3Hvs8YH1x9yaXXZselZCGDTCx1AQEA5dMGixEXYK9+
dHgA3RCEY9F7iYQRVcQZc7+z6orYbkERC4T1L0R2UsxqRIFB5TGwAXsdd8UAv/hz
NcQSNMjBb9MPybj3vrpGu6wRZB4fTHb0CtgHqiu+wr/nII5157k=
=gNwb
-----END PGP SIGNATURE-----

--gKs8a1DayUGWqD8h--
