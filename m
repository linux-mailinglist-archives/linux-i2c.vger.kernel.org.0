Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A58316BD9D2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 21:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjCPUHB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 16:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCPUHA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 16:07:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129612D16C
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 13:06:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A1ADB620F1
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 20:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59152C433EF;
        Thu, 16 Mar 2023 20:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678997209;
        bh=8NqcTFn4siOXW1dpCo43lggCzIv7ucftQBCdDOvr7sg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FGIjBRtZIQSfzo3BLdYRJKuIIjFPMphFZBCs2EPYWNTXYNkCi3ijorKU6cYgPWrb8
         LmNKDiJ0X5oaXtxP1vd4WI30eBbdRH5hqc/Jt59q6mMNgTL7RXWiBbP+jQjsd4riGa
         vELaQCRRL2kUghYa0F1A8rmr+i+CMu6qGmyZRuaKWWChfqV9CFrZGpMWjEV7hA+P4y
         uV0tKSZEE5/3rMAhDNPVqCr+Ei0GmvIY5PnmLFrpM82j1M2JvzSac1v8eEV6HczWqR
         vVI1zD/BxPO6HNmZ1XJWBm8NxXaUKoaSHUt+cf2yCT0Hfpjjt0sZJSQYS0FYtNys7h
         e5uUJo8gKviUw==
Date:   Thu, 16 Mar 2023 21:06:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@huawei.com>
Cc:     linux-i2c@vger.kernel.org, chenweilong@huawei.com,
        f.fangjian@huawei.com, linuxarm@huawei.com, prime.zeng@huawei.com,
        yangyicong@hisilicon.com, Sheng Feng <fengsheng5@huawei.com>
Subject: Re: [PATCH 1/2] i2c: hisi: Avoid redundant interrupts
Message-ID: <ZBN21SDwqNo2GG+7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@huawei.com>, linux-i2c@vger.kernel.org,
        chenweilong@huawei.com, f.fangjian@huawei.com, linuxarm@huawei.com,
        prime.zeng@huawei.com, yangyicong@hisilicon.com,
        Sheng Feng <fengsheng5@huawei.com>
References: <20230313074552.54457-1-yangyicong@huawei.com>
 <20230313074552.54457-2-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u5US34qKMUZETIft"
Content-Disposition: inline
In-Reply-To: <20230313074552.54457-2-yangyicong@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u5US34qKMUZETIft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 03:45:51PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
>=20
> After issuing all the messages we can disable the TX_EMPTY interrupts
> to avoid handling redundant interrupts. For doing a sinlge bus
> detection (i2cdetect -y -r 0) we can reduce ~97% interrupts (before
> ~12000 after ~400).
>=20
> Reported-by: Sheng Feng <fengsheng5@huawei.com>
> Signed-off-by: Sheng Feng <fengsheng5@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Applied to for-current, thanks!


--u5US34qKMUZETIft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTdtEACgkQFA3kzBSg
KbavHxAAit0rgx7MNUqtxThypi1TlF+gAIZrcHvCQ8ick/JpzHG+kdy3TInwtJH0
kD83sqIPOjt9aBE0Pnq830y2zvqxnaMT05WZ0yRUD7e2c71RT8j9XmVqakgXnfHW
iFkSNElYBdYAQCEtU/egTYcA5Pexyn6nB/gV2RGWMpMS2ea4yfpl0bOUepnyQEN9
6jdcIVPPyqjjcs/ywcOnIZnsGS1B0Ocb1f7MmU1syiJO98XPv6FTWcHVFTP/M4sx
flohSYYYvieAN4hsFoPMhG7D7zb1Ci3amA0EPaNXUCbQgXjmfqZM95WAJwmLg2jq
0evvD4q2uJiZKEPCQjJkboeCcEs0dJ9vErPtKY0xauL1A8uDlvwcXkMOGjyqCttE
EJl0P2gi2SJsS8Q9Fb4HV1XHEJ9ms91/8CHlfBqVBYrQxiXM7sTbqhR6WqHsbK3u
brSXWyVXJkLgwhdCATdjEyJCQJhBOC0nGnBPu8awzVm1MhrqhY2juo908LlN8pB4
k4yKIjqqCWNbD0SEGJDI88tPp0gys+4dkQiRxKO5AmxysXSFjSP5QnX4zovMqJJc
uDN0FsBvtn06mm9hoo/RBC/LnbW5CWG80n4gajoLw1KgSGxL9XaOxAED+8Do6bij
ZKtXD6joyZ0d5UQsDXDW1gIhwDLG7LY41YBZrsPolglzfaSGFp4=
=XmJH
-----END PGP SIGNATURE-----

--u5US34qKMUZETIft--
