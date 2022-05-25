Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5725338B8
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 10:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbiEYIo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 04:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiEYIo1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 04:44:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5D44B1C5;
        Wed, 25 May 2022 01:44:26 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id gi33so31733743ejc.3;
        Wed, 25 May 2022 01:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E6g5Lb+lud3z6IBBuIB+xMLxh9m0MkwWAWdE3o4ayS0=;
        b=qfD44tESSCw7bOee8sbiWWI6sjo2GgzH6a0M1B/+nMRqn+KWLIw//KM7sP54cr77ln
         cgnD2R7x3arzrr8UGqBp+PlXFAxebwGM9IBdDDyobSVVryzyoqvFIL2IcCpiJ63KaFQF
         UI1sacv2EzpzU1J4ZfYQa8j/HJk7/4mbkjVJ3Xy6MeAwfZpcP+1FsUTQjNn+XXytrnHA
         tV3gq5tS2/BCs15rPkDhUXe3/PAjYvuSwx2nZCbk/trjIIhFiKbnkoajhodllMO2Iqd+
         J6kg6Yu8ZA5KSl0vPoKK8OyjYznlPoDN/azt4s0IWJRjIG5Y8rvqb2jA/X0Uem5koMBq
         +WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E6g5Lb+lud3z6IBBuIB+xMLxh9m0MkwWAWdE3o4ayS0=;
        b=RY/U08lwAPABLCIn5AmFEd1tebUeW2PqCjahGP+4LYcDVCLZYdF+7m9U6j+i1CMRmq
         anDuo+VgIrRUPJfiGDktW18mJGIi9I908p1+dPkPArd5+RWWhDGeRjgvoGW3Jqp0mX0J
         8dKsDeBlLhRXZiE4NXIKpPB5uQjDAkDXuibJmbzQx/OZrWWIxWyEi8/uAO4MxVdnOvgd
         eD1l9jRYFfpxlU9DgMKnP14abmXyKvT5vi75q/1iNMRhIRbH1GMPcsR5rtNVWHECd+hG
         0FIGI/eY8Rq18tqWitcVqM7/xGtcENvcdxP6SGsf/nKoZ1wsaKNBIgOQLPG+agkhC7bR
         kuMQ==
X-Gm-Message-State: AOAM533MRFFw9ttNwSjwWxD5poHqkyELoaQAIWXKL/PUnq9beIOWuS2u
        lXa7BFuq8J9daGtngpvu/bY=
X-Google-Smtp-Source: ABdhPJy/th87ha2vrnr0+8mjVv4V1E3tMH6MJzoI7W7cZqUdjeh0Iq0zbXC8goO0XRzEy7d2gP5WyA==
X-Received: by 2002:a17:906:6a0d:b0:6ff:15a8:acbf with SMTP id qw13-20020a1709066a0d00b006ff15a8acbfmr919474ejc.143.1653468264674;
        Wed, 25 May 2022 01:44:24 -0700 (PDT)
Received: from michael-VirtualBox (109-186-136-71.bb.netvision.net.il. [109.186.136.71])
        by smtp.gmail.com with ESMTPSA id hy16-20020a1709068a7000b006f3ef214e27sm7934893ejc.141.2022.05.25.01.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 01:44:24 -0700 (PDT)
Date:   Wed, 25 May 2022 11:44:21 +0300
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Guillaume Champagne <champagne.guillaume.c@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Gallichand <mathieu.gallichand@sonatest.com>
Subject: Re: [PATCH] HID: ft260: fix multi packet i2c transactions
Message-ID: <20220525084421.GA7899@michael-VirtualBox>
References: <20220524192422.13967-1-champagne.guillaume.c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524192422.13967-1-champagne.guillaume.c@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 24, 2022 at 03:24:22PM -0400, Guillaume Champagne wrote:
> Only trigger START and STOP conditions for the first and last HID
> packets when i2c writes are split in multiple packets. Otherwise, slave
> i2c devices receive each packet as standalone i2c transactions. Since
> i2c slave devices clear their internal state on STOP, this breaks auto
> increment of the register address written to.
> 
> Concretely, SCL is now held low between processing of HID packets so i2c
> slave devices know to keep increment the same register address when the
> next bytes arrive.
> 
> Co-developed-by: Mathieu Gallichand <mathieu.gallichand@sonatest.com>
> Signed-off-by: Mathieu Gallichand <mathieu.gallichand@sonatest.com>
> Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
> ---
>  drivers/hid/hid-ft260.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 79505c64dbfe..9c5912a21ccb 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -390,6 +390,8 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
>  	struct hid_device *hdev = dev->hdev;
>  	struct ft260_i2c_write_request_report *rep =
>  		(struct ft260_i2c_write_request_report *)dev->write_buf;
> +	bool multi_packet = data_len > FT260_WR_DATA_MAX;
> +	u8 packet_flag = multi_packet ? flag & FT260_FLAG_START_REPEATED : flag;

Please take a look at the https://patchwork.kernel.org/project/linux-input/patch/20220525074757.7519-4-michael.zaidman@gmail.com/
that addresses the same issue but does it more efficiently by adding one
conditional statement per ft260_i2c_write call in the main path vs. three
in this commit. It comes in the patch set with other performance improvements
published on my GitHub https://github.com/MichaelZaidman/hid-ft260 several
months ago. I would greatly appreciate it if you could test and feedback
on the patch set content.

Thanks,
Michael

