Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1029763B61
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 17:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234636AbjGZPmL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 11:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234549AbjGZPmL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 11:42:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B72A1B0;
        Wed, 26 Jul 2023 08:42:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED9B961B8C;
        Wed, 26 Jul 2023 15:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05700C433C7;
        Wed, 26 Jul 2023 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690386129;
        bh=KGnbFhjwc7OHIt6KtSt026Una3CqpWLyyvR6LVXbOjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qDuizAnCDCaBnXxxNz5iBfufd1oAyhvQhvxqbvdUu1x/H0geLB/WzpsUUIcVFH5k+
         B+TXC/0kQF2SzvFUk2YWdMA0ONyjZqto+gNbJ+Yt8IhJnWCFu8UUiz1tX4klARN9hN
         QEIcWCoN+t5YIYuPNYTANVGjlGHcjO4MKF6Fy1yUrOL6ZP6GC3nR2imJbAwR5oqUNi
         4K3L8gxXoi/c0Nx9WuvZzX17Gl7WNicsQRsumIlLh1GPTKXLymiWDaGRwN8g61Mie7
         esI0a0r+eMfVRH13FQopqTVTdfAMHYrpZFprkzLIQUCsulb6NlixVyHNoARMpc/6Tk
         LdZKBsHPxRZRg==
Date:   Wed, 26 Jul 2023 17:42:06 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc:     patrick@stwcx.xyz, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: pmbus: Add ltc4286 driver
Message-ID: <20230726154146.jknn5ys2qnokrnyc@intel.intel>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230724100514.1028061-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230724100514.1028061-2-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724100514.1028061-2-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Delphine,

On Mon, Jul 24, 2023 at 06:05:12PM +0800, Delphine CC Chiu wrote:
> Add a driver to support ltc4286 chip
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

please resend this series withour using in-reply-to. Please read
carefully the comments in v1, add a good description in the
commit log, add versioning and changelog in the cover letter and
run checkpatch.pl before sending.

Thank you,
Andi
