Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE107AED0F
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Sep 2023 14:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbjIZMmZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 08:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbjIZMmZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 08:42:25 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33A7EB;
        Tue, 26 Sep 2023 05:42:18 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-79f92726f47so291539539f.3;
        Tue, 26 Sep 2023 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695732138; x=1696336938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwZZXUR06hKxqMjAtAVkXjuDv/1BvCb8Sk0gpiHu+5I=;
        b=T0cQYIVX/Wv2kEiqHtAk+y7maIKtmPtURs04EdORtH2qRakTjKk0r9y+vBJVi7jfLE
         4wDJEM/nxcvBylOELVMfNkXhRQX1M9tnU5mmtpa6BrCWd0Bn127m9f8mST1J2KsDT2NN
         mwQzXMmByaurHXFuUS4eyJg+k9dd3MIDIxUVlMnulm6hWvpHAjq/CVQZeBBM4O1SRO4e
         7B37RiYUYX5MoIvJwjBOigRdu9wlg5yygl++IQ79LuZQJs4aGtlBQes0eczzJ8eQ2fr/
         pnxdEpgJjLgdmhQz98OSqqZZc6cyh3aeALy6MVo9FX6mtoLNu7x0MCMFds0i8o8tqYP+
         p9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695732138; x=1696336938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwZZXUR06hKxqMjAtAVkXjuDv/1BvCb8Sk0gpiHu+5I=;
        b=tpOCQtOR/TARsNC1yQtkPmXhHw6bpomn1NJFp8URKRw0w/vb665ITp1dWGEzayEpq7
         wTQaH0TV9ByQH+gQ0ID9yMNGWLnkRJIcKIswFVn29lU8zwLXvMuJJM/e6XSXRTsmU8gG
         1lg1yH8ShPXE7DoYUMDFdCNGfvwR1DyDNjERWJ3qvconIIBUnCppuNwvTANEYTih/6He
         VMoB6HnAGRIBGBzSpFNAFsCbuxFUsm7DyDiOl4gCaqwYPuZ51sIHmjyGs1p0qU65hHRL
         ln0T0yjUAf4tlZSr4QJLLKYcuMz1AqQODKVGCitUxDnyPNL4yG7yBsYQe56/CdJ6sf8e
         KaZQ==
X-Gm-Message-State: AOJu0YzyFVDZMdQh2mAKxMRMJI9qfO4Y+A1biKUMYUhCmU5QZdulpUA+
        A/NSlVILXjbvhTGspeMn12M=
X-Google-Smtp-Source: AGHT+IEOiSkG0mndUGYjrWRyD1gPI2GcUvEPRN/qCsJi6tg1cwQOicv8XV55FV90Nh5byZmbTyqpHw==
X-Received: by 2002:a05:6e02:1946:b0:34b:aef9:60d4 with SMTP id x6-20020a056e02194600b0034baef960d4mr12605847ilu.27.1695732138129;
        Tue, 26 Sep 2023 05:42:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m13-20020a056638408d00b0042b326ed1ebsm9584jam.48.2023.09.26.05.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 05:42:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 26 Sep 2023 05:42:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 3/3] hwmon: (xgene) Migrate to use generic PCC shmem
 related macros
Message-ID: <667915e2-3c3f-4afd-a055-d010d55b741e@roeck-us.net>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
 <20230926-pcc_defines-v1-3-0f925a1658fd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926-pcc_defines-v1-3-0f925a1658fd@arm.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 26, 2023 at 01:28:02PM +0100, Sudeep Holla wrote:
> Use the newly defined common and generic PCC shared memory region
> related macros in this driver to replace the locally defined ones.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/xgene-hwmon.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index 78d9f52e2a71..1ccdd61b6d13 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -57,12 +57,6 @@
>  	(MSG_TYPE_SET(MSG_TYPE_PWRMGMT) | \
>  	MSG_SUBTYPE_SET(hndl) | TPC_CMD_SET(cmd) | type)
>  
> -/* PCC defines */
> -#define PCC_SIGNATURE_MASK		0x50424300
> -#define PCCC_GENERATE_DB_INT		BIT(15)
> -#define PCCS_CMD_COMPLETE		BIT(0)
> -#define PCCS_SCI_DOORBEL		BIT(1)
> -#define PCCS_PLATFORM_NOTIFICATION	BIT(3)
>  /*
>   * Arbitrary retries in case the remote processor is slow to respond
>   * to PCC commands
> @@ -142,15 +136,15 @@ static int xgene_hwmon_pcc_rd(struct xgene_hwmon_dev *ctx, u32 *msg)
>  
>  	/* Write signature for subspace */
>  	WRITE_ONCE(generic_comm_base->signature,
> -		   cpu_to_le32(PCC_SIGNATURE_MASK | ctx->mbox_idx));
> +		   cpu_to_le32(PCC_SIGNATURE | ctx->mbox_idx));
>  
>  	/* Write to the shared command region */
>  	WRITE_ONCE(generic_comm_base->command,
> -		   cpu_to_le16(MSG_TYPE(msg[0]) | PCCC_GENERATE_DB_INT));
> +		   cpu_to_le16(MSG_TYPE(msg[0]) | PCC_CMD_GENERATE_DB_INTR));
>  
>  	/* Flip CMD COMPLETE bit */
>  	val = le16_to_cpu(READ_ONCE(generic_comm_base->status));
> -	val &= ~PCCS_CMD_COMPLETE;
> +	val &= ~PCC_STATUS_CMD_COMPLETE;
>  	WRITE_ONCE(generic_comm_base->status, cpu_to_le16(val));
>  
>  	/* Copy the message to the PCC comm space */
> @@ -544,7 +538,7 @@ static void xgene_hwmon_pcc_rx_cb(struct mbox_client *cl, void *msg)
>  	msg = generic_comm_base + 1;
>  	/* Check if platform sends interrupt */
>  	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
> -				    PCCS_SCI_DOORBEL))
> +				    PCC_STATUS_SCI_DOORBELL))
>  		return;
>  
>  	/*
> @@ -566,7 +560,7 @@ static void xgene_hwmon_pcc_rx_cb(struct mbox_client *cl, void *msg)
>  	      TPC_CMD(((u32 *)msg)[0]) == TPC_ALARM))) {
>  		/* Check if platform completes command */
>  		if (xgene_word_tst_and_clr(&generic_comm_base->status,
> -					   PCCS_CMD_COMPLETE)) {
> +					   PCC_STATUS_CMD_COMPLETE)) {
>  			ctx->sync_msg.msg = ((u32 *)msg)[0];
>  			ctx->sync_msg.param1 = ((u32 *)msg)[1];
>  			ctx->sync_msg.param2 = ((u32 *)msg)[2];
> 
> -- 
> 2.42.0
> 
