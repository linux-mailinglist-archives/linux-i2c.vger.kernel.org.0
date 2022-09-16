Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4846C5BB302
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbiIPTsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiIPTsD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:48:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511F7B56F9;
        Fri, 16 Sep 2022 12:48:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 01C4CB828DE;
        Fri, 16 Sep 2022 19:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC5DC433D6;
        Fri, 16 Sep 2022 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663357679;
        bh=ETttYxa/4Oa67rJ8c8c04bzWUxymRvJ/KwEDM2mNqDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l3lEPPk+0Ydl1GhdM+1o2t9KbsPrivCzjlS9cG5oCs3foSKLf275LNq0D7qElFeRb
         vhFND3xL2NvwHfssdAALmjrXrGfzLi5xdckoY5dvG1tR7G75TaawUJhDpPHUkhdO8B
         8Ku24EjyeL3rDdHMDnivqpPN+P2fs88ltijo9CfB39tBjLhIsGLdpDOaUbR4S3nFwk
         Yyz8b385PFGDuCTvtMmYvYtNMZeVnkC3z7C4hn6dbwu+UKKv7cqqmNqk53z5eSTQ7q
         zDtSQbedcafwWwQA+rjLu7kkygUCtALF7ZKJJsb8phoELIspN01YCTJAuaki+IAWBH
         h4ATPJFHIiCIA==
Date:   Fri, 16 Sep 2022 20:47:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     christian.koenig@amd.com, devicetree@vger.kernel.org,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh+dt@kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
Subject: Re: [PATCH v2 1/3] i2c: tegra: Add GPCDMA support
Message-ID: <YyTS7MWbaIS4gAMj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        devicetree@vger.kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com
References: <20220906144716.16274-1-akhilrajeev@nvidia.com>
 <20220906144716.16274-2-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="32nmFRQp6N3nwb33"
Content-Disposition: inline
In-Reply-To: <20220906144716.16274-2-akhilrajeev@nvidia.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--32nmFRQp6N3nwb33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2022 at 08:17:14PM +0530, Akhil R wrote:
> Enable support for GPCDMA, which is used in I2C controllers
> in Tegra 186 and above. The chips before that used APB DMA.
> This change works under the presumption that all chips apart from
> those supporting APB DMA is using GPCDMA.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Applied to for-next, thanks!


--32nmFRQp6N3nwb33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMk0uwACgkQFA3kzBSg
KbbFUhAAl9xFQ0ZgJ5/N9JeaN9q8LBM6DrXhdNPIua4yd0+9grTUWYIT+vpvJ24V
34YS3014fjvw5H7JF43Vi6Vc8IZrxKHW7bQ5qZcuymc1b8nuMZIBIWoCUSBzFbK0
u30i+DeoJSHY3A0AzJHLOz1e7D3NscVpKVBUxhJDfDLX1kb8Yj/cX+9D6mH/efZw
va6KW2xnI970fgltMS98Lmvg4yxdVH4Cyeum3t2g/T5XffPxD5Env/5vFKn/OdCZ
/rB+qNC6I7aeq55YrO+VADc0/4NrctbV+360/nhEEyXNiqS+CPzGa1ah6krlskqP
KrwNdiPutENb6SRmS11hCso0Wv7LaiwE3qXoSwIwILugXZv8sD3Ynu1m3kYqGMTS
TudfbbOhjsDSBbgGlrN+/lAkoXi8GeQyDMHAfYHEyTk3xEP8s8gpP7Tzix4yJHro
JzfvcW62cYecsRRuUqDmUk8VKIwMuFfXVJ0ANeafS7+FA49BgZcI1HTtwKYkMlIO
3sJNrcS/z+cinVI2HcAdTE/0hoVGQr6ejxWg1O/OKWMqVATHXfIlxskAF8ff6MLB
NMRM7tax+2hIRWabmcEdBdUFU6cJrl0QeKYp2CcxW2AQoXcA9FP4QetKmtTseZMW
U+lARi9QF0lXXwmMGhNdLitRTf4PVT0Gde6f7s+YMBCjov3uhIo=
=JyGY
-----END PGP SIGNATURE-----

--32nmFRQp6N3nwb33--
