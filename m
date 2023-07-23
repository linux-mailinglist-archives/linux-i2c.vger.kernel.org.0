Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC76375E4BD
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jul 2023 22:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjGWUI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jul 2023 16:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjGWUI1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jul 2023 16:08:27 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFA4E5E;
        Sun, 23 Jul 2023 13:08:18 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bb119be881so28311195ad.3;
        Sun, 23 Jul 2023 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690142898; x=1690747698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KdLgZdYda9ALgz2CMk7JRJRHzorCluz9a+ObxkNj+YQ=;
        b=BFl8bBNknk8+OOWamcPtj/hgWIH6kXZG4yhu5gfaDqD9Waa5f4EDhglBaWn/bj5ua7
         +BF1sK5bqYIeemt2J5thI6A4p3rvWrqcW56OqdWj9CkkUi4RZuxi5vLXzM3iQTqmAXlA
         ioZoqEjJKqXNdn1hyAh24He3oIZdJ3h5GYsT5ZCuZ7ZukYrPisbwZ30rbCI934p60NkD
         cicVedAHoj41n/zSgNb1qggtDC41emhqw3pYK0zKGtZ46Z/xnV5PwAxe8QAxpMLlQpqI
         DYjYRVw5/+jNA6EQGy+6qK1nKntx7C7TxjAvogYWaeSVmG3xqbdkReI+XHo0tRDcYirl
         xEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690142898; x=1690747698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdLgZdYda9ALgz2CMk7JRJRHzorCluz9a+ObxkNj+YQ=;
        b=Fk+UhLwsUN5nYzGE1vZoH7bYJ43+H2GcqgXrWiKLEcjJUDYp2h9U8n739GjUDLmB9r
         iZLA4E9DMzDDE3sp2te+4yVHSBfmozlSDuxC737OcZiBi6v8Ce7STdIFspdaDZnL7OXW
         cxEnbESBWNKBpODIm1NH9umLm33JEjIr9nhEUPAiPTJqBoFV/1DKgXnagq3U1NfVwckN
         OtMTW28K5PEYC0m7x8u4Jassi9b2mKwExZjI/BpqAW0DBo3YBVg+ixlSg7XmgZcPniwR
         bd38oe9Pm+mGeBO3xeDmsGLu8EWKvjte3efCr6+McdJzxxef6HoYKYbQITBo98Zy2qF5
         F+uQ==
X-Gm-Message-State: ABy/qLYZDRG2WVC160m083sXTrLhHHJHvb4Y4osw5ywXuHbVMSfLr5pG
        n9Qnud8iKLbL1j9TsvmQacg=
X-Google-Smtp-Source: APBJJlFTE1kp/h5SzZWfRucBjSR0x617+b/XJVLpA0KHFTsZcmY3onTIlByggnXCYdSWewFbD4NL5A==
X-Received: by 2002:a17:902:a986:b0:1b8:76fc:5bf6 with SMTP id bh6-20020a170902a98600b001b876fc5bf6mr7981020plb.43.1690142898122;
        Sun, 23 Jul 2023 13:08:18 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8db:3c3:1ff4:2ae3])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902820d00b001b896686c78sm7252211pln.66.2023.07.23.13.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 13:08:17 -0700 (PDT)
Date:   Sun, 23 Jul 2023 13:08:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZL2Ir6ZZoewOwMNf@google.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jul 23, 2023 at 09:37:21AM +0100, Biju Das wrote:
> Add i2c_device_get_match_data() callback to struct bus_type().
> 
> While at it, introduced i2c_get_match_data_helper() to avoid code
> duplication with i2c_get_match_data().
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/i2c/i2c-core-base.c | 38 +++++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 60746652fd52..80259111355b 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -114,20 +114,41 @@ const struct i2c_device_id *i2c_match_id(const struct i2c_device_id *id,
>  }
>  EXPORT_SYMBOL_GPL(i2c_match_id);
>  
> +static void *i2c_get_match_data_helper(struct i2c_driver *driver,
> +				       const struct i2c_client *client)
> +{
> +	const struct i2c_device_id *match;
> +
> +	match = i2c_match_id(driver->id_table, client);
> +	if (!match)
> +		return NULL;
> +
> +	return (const void *)match->driver_data;

Not sure if this helper is needed given that in the end (hopefully) we
can simply remove i2c_get_match_data() and leave only
i2c_device_get_match_data().

i2c_get_match_data() and leave only i2c_device_get_match_data().

Thanks.

-- 
Dmitry
