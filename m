Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6046B7C5F77
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 23:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbjJKVwE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 17:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjJKVwD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 17:52:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0561B7
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 14:52:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AB6C433C7;
        Wed, 11 Oct 2023 21:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697061122;
        bh=JqhCwHb8PQfMCKIkOxH7uKJNhdmOm4nUsMeHNOZ8qQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gecUQ1GLHGorSfjA/JfhOvzQRvMTh8/XeVh28dr6Cg4o940TVRzZJyl61M/cBf4kO
         +1MPVm8UTAtDlTo+fsUM8pa2IYfSFMSX7nlr7b8q1bHdz6uDgbS28BHLyVoXG+M+dt
         Q85d3E1JhqS+4jxeUUsO2bN5+e7Vk7Uidd1x+vQx0Pp5w1l9DplSL3vzLQPA5TFrGn
         07GMeK7BCS264TCpTwaSWyuVkPeVHDzYaO6sa9j9vCD16VCaa0MxYroOO1J9D2IuI2
         W8Z3wuCnUvcRB0jIsdj/qZcm/9aMDjXoYqqzLMeumWcMWaxqc2oDpsLzQQ7gZsgSDW
         wqUq5RGb8h7lw==
Date:   Wed, 11 Oct 2023 23:51:58 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Simplify class-based client device
 instantiation
Message-ID: <20231011215158.zfwzatxsbenjgsvu@zenone.zhora.eu>
References: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

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

Don't see anything odd here, Jean, any idea here?

Andi
