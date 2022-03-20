Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F50B4E1AEC
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Mar 2022 10:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239894AbiCTJnh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Mar 2022 05:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239506AbiCTJng (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Mar 2022 05:43:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F7749F84;
        Sun, 20 Mar 2022 02:42:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A5762B80DB3;
        Sun, 20 Mar 2022 09:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA43C340E9;
        Sun, 20 Mar 2022 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647769331;
        bh=m+CrXHcs1IMz031io+qrVwSLHQcIkDc2WgYRBJMoU5I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SJCZbu5FTyVw0taTsBz0vOAiE+XN0VdhH5f9jqSD6hhSETTg2crd9GcDC3tMqcq9O
         crMsDdveov+dpqa5KsNJLxCkdzYtdp7u/knUnkWSQB5/SH5br4ZXr6A8qXBPIzV+tO
         KWUXxmCuYOH1l1sRamcEmt9hNAeKvyKJxwDVxNN6NsUuJA0L8eBaJbsn7La85DMoyO
         0Db5sSXyhbZImY+adn7DqnDhUscYF7vfYJpaJHXaM5juFox+JK+HtfpxPNJnv0x6HD
         Z4VxOnPUYP3u3qSTQjlmiMBVwAk8ELMWyGsHzaTSSLDQx4PDHN9T2t17D9qLCdUYr4
         2HSZAlJoKtZGw==
Date:   Sun, 20 Mar 2022 10:42:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
        lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
        andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/11] arm: dts: add new property for NPCM i2c module
Message-ID: <Yjb27Qbl8VRFZTkm@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski@canonical.com, yangyicong@hisilicon.com,
        semen.protsenko@linaro.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-2-warp5tw@gmail.com>
 <YjTrgia/VX6rBT1r@shikoro>
 <CACD3sJarf9jBny8ru0YihehT4C6k1pqw9Ln+5a+Rs6_F_o6=AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zy3zYHWxJ9cmIO3t"
Content-Disposition: inline
In-Reply-To: <CACD3sJarf9jBny8ru0YihehT4C6k1pqw9Ln+5a+Rs6_F_o6=AQ@mail.gmail.com>
X-Spam-Status: No, score=-8.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zy3zYHWxJ9cmIO3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tyrone,

> There are still some discussions for the patch V4 and it might take
> some time though.

Take your time, I am not in a hurry. Just wanted to outline the best
process so it will be easier to apply the new version.

> Yes, the dts patch could be submitted via arm-soc.

Great.

> I really appreciate your comments.

Thank you and happy hacking,

   Wolfram


--zy3zYHWxJ9cmIO3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI29u0ACgkQFA3kzBSg
KbYWaQ/+OmWLzRVx0uITX7+yRTH8JlxcvGXr/kxT3kHYYKURJbJQLUDXrLgAasbq
Yaf+7x9LECjsNF2zpr6ndF/pxvClrDmVdH7MMjjXrpMVgcFFQiJFufMkDDURtT+w
ed7maEfDwwk1gjnrgZfmIKONhnrw0PwOxu+W+5N+gT7cX/i6/cmm4k9OMV18VJLs
hMhz/DXuYFwqj/NKrDbQSqeRp9hPmNWXMWHWBaJARZOL6rB7/uLwM2JvJOJl/1gS
X5upnQGJIBQs9LQ8TKFZqBHLb6HUBi4YE/EKGfVsAmJh48TdaIe4ava7X1ec41wc
MBKW64Q5Hqmh85pSZLwTqkbhS/4xFIDUClPuV3ED8RzOdVWD9EMc3ubXrxYppEU1
dTsp76kgMJjVoa17zizzMx2dvvceuonI0QPZvltb/qoWWeGrPt6HS5Lr+GzMtQ+e
6tuIcmCxQnbIPVNvsXAO+ISzw4g07AEJTHD7azy3PMVRoo6YBajHiwWbRC9Q6+Iw
H1BYlsOIvrVrYyydfN1gnxycbnwGDVu3ZVy+CCwIAeU4QLzHW+HobLHQg+U76wOr
sz/KN/t+7XzP3bHUiLI9DjBP/PLxs5A2fJqNMZi8MiOH6WGAFPOJ+cP4GRN5F4Hk
1xyPmSk+WQHr33vieTjYoG3hIAuMvJQPvbyyVAsl8rT0o/3/Ic4=
=7k8X
-----END PGP SIGNATURE-----

--zy3zYHWxJ9cmIO3t--
