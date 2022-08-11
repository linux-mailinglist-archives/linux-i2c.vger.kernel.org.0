Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A586B58FBFB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 14:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234953AbiHKMO4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 08:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiHKMOz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 08:14:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC7394EC0;
        Thu, 11 Aug 2022 05:14:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 38D75B82065;
        Thu, 11 Aug 2022 12:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2238AC433D6;
        Thu, 11 Aug 2022 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660220091;
        bh=RsSEfgBid7+M152WD5DK7Qcyfd/tAFwT6LFK6hzX6ck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OsE8pog2Yng6es7jml4aXW4m7as0lYLs90bF9iKr+1R+psn00dTtkS12cIFz3cCh2
         xywJ0+YXw40p1pQCpfQpn0DpPOc+h09alagM/gbti7pqbFWRD3KSWY2TabB4/5sj0v
         GB6b6GfyVNtdjdMfG2/lo0N99QHKir2sRU6HcA546YUbutfQM0/LKnf+uA/7D3VkJW
         82AUQYOOU5kEr2+IFgIljT+vAX3rZNPj9eDA0MSnJArmmwWwczVPWjNhnhqstXc5pn
         StJZWXUuNzdoLZ/ZTjDchC5T2pw0jWUvKH/pKdKnCiGdTsFXYSSo+BbGzdbdR9XHmd
         gP1sWiE9CLgdA==
Date:   Thu, 11 Aug 2022 14:14:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Robin Reckmann <robin.reckmann@googlemail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Robin Reckmann <robin.reckmann@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
Message-ID: <YvTyt4nmOZqQYSCa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Robin Reckmann <robin.reckmann@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Robin Reckmann <robin.reckmann@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20220807140455.409417-1-robin.reckmann@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bWT5sNRrWvbSSOGt"
Content-Disposition: inline
In-Reply-To: <20220807140455.409417-1-robin.reckmann@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bWT5sNRrWvbSSOGt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 07, 2022 at 11:04:54PM +0900, Robin Reckmann wrote:
> Fix i2c transfers using GPI DMA mode for all message types that do not set
> the I2C_M_DMA_SAFE flag (e.g. SMBus "read byte").
>=20
> In this case a bounce buffer is returned by i2c_get_dma_safe_msg_buf(),
> and it has to synced back to the message after the transfer is done.
>=20
> Add missing assignment of dma buffer in geni_i2c_gpi().
>=20
> Set xferred in i2c_put_dma_safe_msg_buf() to true in case of no error to
> ensure the sync-back of this dma buffer to the message.
>=20
> Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>

Applied to for-current, thanks!


--bWT5sNRrWvbSSOGt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL08rcACgkQFA3kzBSg
Kbb4PQ/7BUKwYjOpQITlLf26s6hZcBGyYf17OjfwZTI3mATFsdX3AaDRh18mDEl5
8MhL3B7c9cy5AL7iuPQOI+K7rpyg/djLLPJ6C994uE/mvy/Uek8ReLBt/4Pry5xR
0u/f60/w9sooP86L3Y0d02eGMXJR5DwZTh+l8LdpKIA63WYrCYqGD/jXArbQN/5I
snQaD9zsnUVx94wj9v5YW7JX3/JEfiI5/hMKJRlwnn3tdPnzk/y7i0ppby8RLH0E
Pg2RMV46tTUVo+YP2565464cQjf39DIQdjcWIiaxVs8s5pkvBa5pfDecV5eAWY83
21hEWuHKbwJdGnsxiKGoa3K94fBjrUNB7dhoyoY0GsWh5JfxeirmnjmrjCYP/0FP
50nWMa7jjwmWjVgS/HWjU3DTpHDAncpogPdxjQoCuZwqWA4YjSoEqbQEb2pB+yER
ejRbrqsoDrzHJ3gvqIzGraQYDLp880KZTHZ+UbJkwxd0iisok2ISJaMmV8cRELos
P9WuOLtUtoA8MhAImGi7gL+N9DTmw3oc5N51y83ij6+CUZTiHYIaKX18yaNC2qic
/UpKqrKyarvt0at33rwt3j9M/nRw9vY2gr0YLEpc2Tsi4AuxPjsaGTWUG7Kw4hH3
PuWIC3YJn3cBP5ORPeIbuDG6/Z2glVhY5xqlMLuG1QygGfR0C74=
=B6wR
-----END PGP SIGNATURE-----

--bWT5sNRrWvbSSOGt--
