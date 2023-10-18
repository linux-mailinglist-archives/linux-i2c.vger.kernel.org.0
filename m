Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A077CD2DC
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Oct 2023 06:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjJRE3V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Oct 2023 00:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjJRE3V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Oct 2023 00:29:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC311C6
        for <linux-i2c@vger.kernel.org>; Tue, 17 Oct 2023 21:29:19 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4F4C433C7;
        Wed, 18 Oct 2023 04:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697603359;
        bh=6vM/PMKoZFrryovMR1S0iuAVrNCCLbHoN5h8rCmypEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e3aZLEW12RPOyzeI8/ag1ryt7Me1AM1o24EsEAV7vkoeZnOd+tCNbB9v04Zzn76zb
         Y8v1JhuZiIfdqrU0MWSw4CKDElXc5C/bA0Gb+5AHOOlzmuFakj93WW6ClJtKIvB1ry
         2QVUjmc4WV9Jnszz+N+ewOjHQuBAUdIHw0fp8hDAYJfOCo4fFFAJcBUeAvxzE1k4jR
         7Pjdd5w13eumhlN8yeuxtw9fYQ8P4Ghh1N5TZcJ91FlmAhlNeAhggVTfd1cKzQ79S6
         aO00i47VUva1crBefstZmvP1NucusbFgNjsjIuJEzoHJUFFCrrwg11eVE6GiXTerV/
         4NRkWXsUjCrTg==
Date:   Wed, 18 Oct 2023 06:29:15 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Simplify class-based client device
 instantiation
Message-ID: <20231018042915.c777albmt3ik4q5v@zenone.zhora.eu>
References: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Tue, Oct 10, 2023 at 09:27:44PM +0200, Heiner Kallweit wrote:
> Now that the legacy eeprom driver was removed, the only remaining i2c
> client driver with class SPD autodetection is jc42, and this driver
> supports also class HWMON. Therefore we can remove class SPD from the
> supported classes of the i801 adapter driver.
> Legacy class-based instantiation shouldn't be used in new code, so I
> think we can remove also the generic logic that ensures that supported
> classes of parent and muxed adapters don't overlap.
> 
> Note: i801 parent supports just class HWMON now, and muxed childs
> class SPD, so the supported classes don't overlap.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
