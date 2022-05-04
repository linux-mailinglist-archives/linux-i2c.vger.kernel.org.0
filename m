Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A536519EE4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 14:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344964AbiEDMKK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 08:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234191AbiEDMKK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 08:10:10 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830001CB1B;
        Wed,  4 May 2022 05:06:34 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id x22so651346qto.2;
        Wed, 04 May 2022 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=+WNZryBXL+g7kwNzKGyTKWK4wg/wzwMgT6OB9tUEVx4=;
        b=ZhzXCEkMq4XwxySq3BgrlTremloLuIKnLA4pTWCqSN9GHXJ7dLD8mUJk/a6Cx4DV9W
         qtBExIMVKBAmXh6F1zj87sqgxLJJoNG2txnzswjsQGHmgWu/KYeYWE6K5H9gp7SW1sI5
         FvlrNc8ComRabkEV3E0joBA8MMxDscVIJoHVfHhOSci22mtwHPfELk8iLcRGDJ15ELIO
         QV/ET9LIWtE+LIp4kymM9EWIX3H72WMXcj5bRrb0wTFn5gkJ4iPpugvtCjMT928AliNZ
         7ElEpkBUxqZBip8N0hWXNku1ShOJ7TwDuPgcw64PDBIcHnngwNTweMqLJopbxEcd/iQG
         uu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=+WNZryBXL+g7kwNzKGyTKWK4wg/wzwMgT6OB9tUEVx4=;
        b=q5nT4tnW2bdprc8Pq37rWqn+Cxt/s4KvB3lzX92ByZvnpZmaEWouMFZiIBPbSZqSt0
         ire+0tVLTq9J6PlNyZvaYj2CHIV9r//Fje2a4+sgjSsS9pkTG782E5XWmmJsMykM34wq
         Co7gNr9VWt//VOwkIiBtKjYq/ihkf/drSEiF5ni1CPIb5hkayU017t9D13Koa2g0yogT
         lsx07AAM1pUNFleJrCLqZJthdxabIg16+cwQtlaNrfX5Gilwe7FpgOogqeBIZO+Hku2s
         vL8QXY8Oh4C2OisyxdHgDy2jhFQ9yLQ6c6SkdY3i7sDOglAWSGRdhoJawb+sCYojvq57
         AdGQ==
X-Gm-Message-State: AOAM533Hf/8UVTCpz8bk/p4TvRSzGCXLrd8xiFK8bw8LwlYY9nea/7aF
        DiR1Khm6mATMZtHCXvHw8g==
X-Google-Smtp-Source: ABdhPJy8E2ZGhOMqaubc9bI3GOFs28UeBhEN5Ik/qSGSpbMeojwEWqvAJa0IzwkfLKv2xoNBPuJkig==
X-Received: by 2002:a05:622a:1ba7:b0:2f3:a08e:7c11 with SMTP id bp39-20020a05622a1ba700b002f3a08e7c11mr15849578qtb.10.1651665993525;
        Wed, 04 May 2022 05:06:33 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id l184-20020a3789c1000000b0069fc13ce22esm7512348qkd.95.2022.05.04.05.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 05:06:33 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:149c:2dc6:c0ab:4341])
        by serve.minyard.net (Postfix) with ESMTPSA id 322621800BD;
        Wed,  4 May 2022 12:06:32 +0000 (UTC)
Date:   Wed, 4 May 2022 07:06:31 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openbmc@lists.ozlabs.org,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-kernel@vger.kernel.org,
        Phong Vo <phong@os.amperecomputing.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        Open Source Submission <patches@amperecomputing.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [Openipmi-developer] [PATCH v7 1/3] ipmi: ssif_bmc: Add SSIF BMC
 driver
Message-ID: <20220504120631.GE3767252@minyard.net>
Reply-To: minyard@acm.org
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-2-quan@os.amperecomputing.com>
 <20220423015119.GE426325@minyard.net>
 <ec7b86ec-827f-da64-8fd2-eae09f802694@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec7b86ec-827f-da64-8fd2-eae09f802694@os.amperecomputing.com>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 04, 2022 at 01:45:03PM +0700, Quan Nguyen via Openipmi-developer wrote:
> > 
> > I seem to remember mentioning this before, but there is no reason to
> > pack the structures below.
> > 
> 
> The packed structure is because we want to pick the len directly from user
> space without worry about the padding byte.
> 
> As we plan not to use the .h file in next version, I still would like to use
> packed structure internally inside ssif_bmc.c file.

Packed doesn't matter for the userspace API.  If you look at other
structures in the userspace API, they are not packed, either.  The
compiler will do the right thing on both ends.

> 
> > And second, the following is a userspace API structures, so it needs to
> > be in its own file in include/uapi/linux, along with any supporting
> > things that users will need to use.  And your userspace code should be
> > using that file.
> > 
> 
> Meantime, I'd like not to use .h as I see there is no demand for sharing the
> data structure between kernel and user space yet. But we may do it in the
> future.

If you have a userspace API, it needs to be in include/uapi/linux.
You may not be the only user of this code.  In fact, you probably won't
be.  You need to have a .h with the structures in it, you don't want the
same structure in two places if you can help it.

> 
> > > +struct ssif_msg {
> > > +	u8 len;
> > 
> > Just to be 100% safe, it might be better to use a u16 on this.  The spec
> > sort of limits this to 255 bytes, but it also sort of leaves it open to
> > be larger.
> > 
> Yes, u8 only limited to 255 bytes and there is no space for future grow.

Please make it a unsigned int for the length and __u8 for the data to
give necessary flexibility.

Thanks,

-corey

> 
> > > +	u8 payload[MSG_PAYLOAD_LEN_MAX];
> > > +} __packed;
> > > +
> > > +struct ssif_part_buffer {
> > > +	u8 address;
> > > +	u8 smbus_cmd;
> > > +	u8 length;
> > > +	u8 payload[MAX_PAYLOAD_PER_TRANSACTION];
> > > +	u8 pec;
> > > +	u8 index;
> > > +} __packed;
> > > +
> > > +/*
> > > + * SSIF internal states:
> > > + *   SSIF_READY         0x00 : Ready state
> > > + *   SSIF_START         0x01 : Start smbus transaction
> > > + *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
> > > + *   SSIF_REQ_RECVING   0x03 : Receiving request
> > > + *   SSIF_RES_SENDING   0x04 : Sending response
> > > + *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction
> > > + */
> > > +enum ssif_state {
> > > +	SSIF_READY,
> > > +	SSIF_START,
> > > +	SSIF_SMBUS_CMD,
> > > +	SSIF_REQ_RECVING,
> > > +	SSIF_RES_SENDING,
> > > +	SSIF_ABORTING,
> > > +	SSIF_STATE_MAX
> > > +};
> > > +
> > > +struct ssif_bmc_ctx {
> > > +	struct i2c_client	*client;
> > > +	struct miscdevice	miscdev;
> > > +	int			msg_idx;
> > > +	bool			pec_support;
> > > +	/* ssif bmc spinlock */
> > > +	spinlock_t		lock;
> > > +	wait_queue_head_t	wait_queue;
> > > +	u8			running;
> > > +	enum ssif_state		state;
> > > +	/* Timeout waiting for response */
> > > +	struct timer_list	response_timer;
> > > +	bool                    response_timer_inited;
> > > +	/* Flag to identify a Multi-part Read Transaction */
> > > +	bool			is_singlepart_read;
> > > +	u8			nbytes_processed;
> > > +	u8			remain_len;
> > > +	u8			recv_len;
> > > +	/* Block Number of a Multi-part Read Transaction */
> > > +	u8			block_num;
> > > +	bool			request_available;
> > > +	bool			response_in_progress;
> > > +	bool			busy;
> > > +	bool			aborting;
> > > +	/* Buffer for SSIF Transaction part*/
> > > +	struct ssif_part_buffer	part_buf;
> > > +	struct ssif_msg		response;
> > > +	struct ssif_msg		request;
> > > +};
> > > +
> > > +static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
> > > +{
> > > +	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
> > > +}
> > > +#endif /* __SSIF_BMC_H__ */
> > > -- 
> > > 2.35.1
> > > 
> > > 
> 
> 
> 
> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer
