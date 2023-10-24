Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E99317D5C3E
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 22:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344256AbjJXUOr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 16:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343896AbjJXUOq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 16:14:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6B5E8;
        Tue, 24 Oct 2023 13:14:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7202C433C8;
        Tue, 24 Oct 2023 20:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698178484;
        bh=4NpmDn3tQbzBHiZ0ROs1DdItLc5V7g3xpUtTffxVMnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OkCQZLI/dAFo1q/sUPglJJr/mrlllBh62SaHxGT1LCKJTW8p4l65swOWiB/oWbJ42
         k86r5sdgZGYZoLbIFiCGUjVLQ2Jywe32c/by2k+9f0uQHiVxEXGGpWiA+uOlmSiy6A
         NecEvwDBEfjlDI+UdfPfxAsC8V9/9JFgHi5OtN5FwCMuI4bPbUXwnkiuwAhI3fbOS/
         6klkByPam1m+lIf9K8W36B6kaSGgZMif5tY6F3k2s3dBgWbFcbPatOUa02xt6xwQM8
         Zdhz5LdqdBxF4YbnGzyaSGCjN0C1sgCGqt8MFl3Th+IqjWZlT/+03gVZ/8+JYmt8Wd
         Q5SDuE/2yFXNw==
Date:   Tue, 24 Oct 2023 22:14:40 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Piyush Malgujar <pmalgujar@marvell.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        rric@kernel.org, cchavva@marvell.com, sgarapati@marvell.com,
        jannadurai@marvell.com
Subject: Re: [PATCH v2 0/4] i2c: thunderx: Marvell thunderx i2c changes
Message-ID: <20231024201440.ey7pjah7fq33mbwm@zenone.zhora.eu>
References: <20230728120004.19680-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728120004.19680-1-pmalgujar@marvell.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Piyush,

On Fri, Jul 28, 2023 at 05:00:00AM -0700, Piyush Malgujar wrote:
> The changes are for Marvell OcteonTX2 SOC family:
> 
> - Handling clock divisor logic using subsytem ID
> - Support for high speed mode
> - Handle watchdog timeout
> - Added ioclk support
> 
> Changes since V1:
> - Addressed comments, added defines as required
> - Removed unnecessary code
> - Added a patch to support ioclk if sclk not present in ACPI table
> 
> Piyush Malgujar (1):
>   i2c: thunderx: Adding ioclk support
> 
> Suneel Garapati (3):
>   i2c: thunderx: Clock divisor logic changes
>   i2c: thunderx: Add support for High speed mode
>   i2c: octeon: Handle watchdog timeout
> 
>  drivers/i2c/busses/i2c-octeon-core.c     | 96 ++++++++++++++++++------
>  drivers/i2c/busses/i2c-octeon-core.h     | 27 +++++++
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 23 ++++--
>  3 files changed, 115 insertions(+), 31 deletions(-)

I was going through the patches that failed to receive an answer,
is this series still valid? Do you still need a round of review
here?

Andi
