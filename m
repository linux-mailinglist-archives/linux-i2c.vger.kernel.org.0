Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD394492622
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 13:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240880AbiARMxf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 07:53:35 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:58560 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240692AbiARMxf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 07:53:35 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 77BAD1F3C0;
        Tue, 18 Jan 2022 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642510414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x2EKQsL308PSWT1sdGUc5riOtsis6JmdU1wQjEpN59k=;
        b=so+2Usj+A7gyCKmv/jNExozYU+x/6YhmZiJE+lIXMwbciPgqFdiDETLcG4Hqp5kapkJ6I7
        GbZNrFtgasFuQjSRZad9DX4OhXAHEHhQ829GtVUzlh2PWmx3cjovyMo6fy3PGyMmgr8AoK
        +Rtr2uctYmhWrnn+NaPSQu6VamOhZqk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642510414;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x2EKQsL308PSWT1sdGUc5riOtsis6JmdU1wQjEpN59k=;
        b=axGQwFGszgeEkRpf9YPSg2ET/OJUBE8an6Sudb+wbPXP9+7oAYY3whbMRm+oKcAU5HwLjx
        hniEuNrdmWrGmCCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1EAC213A42;
        Tue, 18 Jan 2022 12:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id h476BE645mFVAQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 18 Jan 2022 12:53:34 +0000
Date:   Tue, 18 Jan 2022 13:53:32 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Alex Henrie <alexh@vpitech.com>
Cc:     Hector Martin <marcan@marcan.st>, linux-i2c@vger.kernel.org,
        wsa@kernel.org, alexhenrie24@gmail.com
Subject: Re: [External] Re: [PATCH v3] i2c: i801: Safely share SMBus with
 BIOS/ACPI
Message-ID: <20220118135332.3a56fe57@endymion>
In-Reply-To: <20211217195128.49285f55facfe061655a6279@vpitech.com>
References: <20211216173110.82ae177385322c0992d00126@vpitech.com>
        <a5da4d27-f2cc-9018-5266-9f40d74818ad@marcan.st>
        <20211217195128.49285f55facfe061655a6279@vpitech.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 19:51:28 -0700, Alex Henrie wrote:
> The BIOS appears to access the SMBus during the first few minutes after
> boot, and then it stops using it. So "safe" may not be the right word,
> but in my case, it seems to work OK to use the SMBus as long as the
> uptime is greater than a few minutes.

This is a fairly uncommon pattern. Do you have an idea, which device
and registers the BIOS is accessing? Did you try tracing it?

-- 
Jean Delvare
SUSE L3 Support
