Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5770C738191
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 13:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjFUJdO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 05:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjFUJc1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 05:32:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB55210F9;
        Wed, 21 Jun 2023 02:31:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29390614E5;
        Wed, 21 Jun 2023 09:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C3DC433C8;
        Wed, 21 Jun 2023 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687339891;
        bh=EUSesneT0o86LDgLJNC+GIV1CW3amoMBxOwhWtk/CFI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S3uQfPk/+C7R/9fVCGwbVnwyI2AiuPZpH64i0GBcknHTOTb3hmaHgjDTLZo85u75b
         cV1kRKE4hWXJP31yVZBTYQUJd/Zl28tJflwBdlPM5paW7FLxiJQLQcJ+eXnzDsmlfa
         tqtjot9z5h6bv2WfGk8ALIEOACFwCQkkuyv9e6ZqVMziUoLjTC4kTDKZgT+WMK6HDe
         CW4fuYq6vofJQBZfPb/lsMxX3Oy54MDrW+V8Qr+QA5FxI2uOTP5V7/A1u4018aUfp0
         kJ24ducK9uMxpX362dmronQyDr9VXx59UhARjHg9WeoYvPWQoLR5YEPojxCBx61VPC
         fNtzycYcXIZyQ==
Date:   Wed, 21 Jun 2023 11:31:28 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>
Subject: Re: [PATCH v1 2/2] ACPI: platform: Move SMB0001 HID to the header
 and reuse
Message-ID: <20230621093128.azqlkwulmkb3tvgl@intel.intel>
References: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
 <20230620163534.1042-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620163534.1042-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Tue, Jun 20, 2023 at 07:35:34PM +0300, Andy Shevchenko wrote:
> There are at least two places in the kernel that are using
> the SMB0001 HID. Make it to be available via acpi_drivers.h
> header file. While at it, replace hard coded one with a
> definition.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
