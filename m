Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AACF33D76F2
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 15:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236714AbhG0Ni5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 09:38:57 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:38050 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236693AbhG0Ni4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 09:38:56 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 901262012E;
        Tue, 27 Jul 2021 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627393135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cuMnZ/cepKf3ULcZi6QGcGj0uS7BmiWFdKTmFEH86Is=;
        b=AqTNEO1V5N1+7GaepRoTT0I9Txl0Oe55Pr1GY4WfZVCUpuZQ1UaM3oQQZd8iCTWMnRwo4v
        itlNhDTJoX4vqz3bLFNHgKaERYF3hCmmxwUue5CrX6/7z6aOzyc6/2LRgohTZ2oy1vGWE8
        cYXStAJW4UU6v29FyTldB2C2xBVCMo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627393135;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cuMnZ/cepKf3ULcZi6QGcGj0uS7BmiWFdKTmFEH86Is=;
        b=gSDhYzSuvdg02WL3dOBZc/w9u2fdpyqLlzh4OD/OaG/COQse6OE6U1edUYusjSv1ykELQ2
        l5fXrsIvFRukJFDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6394513CF4;
        Tue, 27 Jul 2021 13:38:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id t47sFW8MAGH8fQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Tue, 27 Jul 2021 13:38:55 +0000
Date:   Tue, 27 Jul 2021 15:38:52 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: i2c-tools 4.3 has been released
Message-ID: <20210727153852.63b19130@endymion>
In-Reply-To: <20210722163745.7d94e450@endymion>
References: <20210722163745.7d94e450@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 22 Jul 2021 16:37:45 +0200, Jean Delvare wrote:
> A new version of i2c-tools was tagged and released today. You can
> download i2c-tools 4.3 at the usual place:
> https://www.kernel.org/pub/software/utils/i2c-tools/
> 
> It includes almost one year worth of fixes and improvements. Changes
> are as follows:
>   * decode-dimms: Attempt to decode LPDDR3 modules
>   * eeprom, eepromer: Removed the tools in favor of eeprog
>   * i2cdetect: Sort the bus list by number
>   * i2cdump: Add range support to I2C block mode
>              Deprecate SMBus block mode
>   * i2cget: Add support for I2C block read
>             Add support for SMBus block read
>   * i2ctransfer: Reverted check for returned length from driver

Unfortunately I made a packaging mistake when preparing the tarballs.
The prefix inside the archive was accidentally set to i2c-tools-4.0
instead of i2c-tools-4.3. As this is quite confusing and inconvenient
for distribution packagers, I have just regenerated and pushed a clean
tarball with the proper prefix. Just give it some time to reach the
mirrors.

-- 
Jean Delvare
SUSE L3 Support
