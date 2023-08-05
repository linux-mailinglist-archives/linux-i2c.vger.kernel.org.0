Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106A4770F87
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 14:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjHEMGQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 08:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjHEMGP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 08:06:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FD844BD;
        Sat,  5 Aug 2023 05:06:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B7B860CBB;
        Sat,  5 Aug 2023 12:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BD2C433C7;
        Sat,  5 Aug 2023 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691237173;
        bh=TRPYCQRDP5jcMNBUvnQVXjyvFmfZ0bZwv5+82ppFp98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a8+v6/+HPGOyXUV1XSDmpMObQb0WhFfTvJhUlkdydkVP1x4mMA8elqyORYcklGVhH
         X0R5095NXK6K7A4zAFUxV4TPO97xqfE+xKMzUEf81NTpdsRIkkfRujJrgUVuls48Kd
         IR8AtjGG+nTCxDNx8IzfXTQK1CQ0SQX184Np36Ycq6iwYYxpbxsiIN1VtmBKvzydCI
         lV1cDlFQhVDn9xk2n5qcwDvqXTxgAPwVuOIqvlcxQgy8KRgMBWxkQwNpwCEc3HBU2o
         of9b/qOc7bA2iIZiSH4i6IiWo7jyzotl3AkuWIZGwXYDYxyc5CpAEoBvH9axdeuIxW
         bbJLQYohTf4Jw==
Date:   Sat, 5 Aug 2023 14:06:10 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Piyush Malgujar <pmalgujar@marvell.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        rric@kernel.org, cchavva@marvell.com, sgarapati@marvell.com,
        jannadurai@marvell.com
Subject: Re: [PATCH v2 0/4] i2c: thunderx: Marvell thunderx i2c changes
Message-ID: <20230805120610.lvnyhggrwcwq66x4@intel.intel>
References: <20230728120004.19680-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728120004.19680-1-pmalgujar@marvell.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Robert,

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

any chance you could take a look at this series?

Thanks,
Andi
