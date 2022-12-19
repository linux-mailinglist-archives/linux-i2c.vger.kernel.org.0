Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111D3650D11
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 15:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbiLSOMK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 09:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbiLSOMJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 09:12:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28F8E0BA
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 06:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671459077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UEaKv7yOU9BXWyw4wC4hTR9UVbDzcTvgjzbUbtvzYDQ=;
        b=fIZ5LI8dgGdGmurLZbf+llWQMfmi7R1MTcU87XJ3fgXsWL1uCJ8L/qMruaWulsCqaXZpJj
        yiR0tiAzZXwPr4JrL8SmWo+VpT5qKfBDc0aBUk/bw8L83DJllWyiuB/f34YkBJtSriOhxv
        Bk8h1xxq1oGGzGKj9hc9vjOQsDJCWtI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-fF1zjqy-NbSq2otPhmIJMA-1; Mon, 19 Dec 2022 09:11:14 -0500
X-MC-Unique: fF1zjqy-NbSq2otPhmIJMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21C49802C1D;
        Mon, 19 Dec 2022 14:11:14 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.39.195.17])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E03822026D4B;
        Mon, 19 Dec 2022 14:11:12 +0000 (UTC)
Date:   Mon, 19 Dec 2022 15:11:10 +0100
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Enrik Berkhan <Enrik.Berkhan@inka.de>
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sven =?utf-8?Q?Z=C3=BChlsdorf?= <sven.zuehlsdorf@vigem.de>,
        linux-kernel@vger.kernel.org, Rishi Gupta <gupt21@gmail.com>
Subject: Re: [PATCH v2 1/3] HID: mcp2221: don't connect hidraw
Message-ID: <20221219141110.svhxnmanmzf5fke3@mail.corp.redhat.com>
References: <20220926202239.16379-1-Enrik.Berkhan@inka.de>
 <20221103222714.21566-1-Enrik.Berkhan@inka.de>
 <20221103222714.21566-2-Enrik.Berkhan@inka.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103222714.21566-2-Enrik.Berkhan@inka.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Nov 03 2022, Enrik Berkhan wrote:
> The MCP2221 driver should not connect to the hidraw userspace interface,
> as it needs exclusive access to the chip.
> 
> If you want to use /dev/hidrawX with the MCP2221, you need to avoid
> binding this driver to the device and use the hid generic driver instead
> (e.g. using udev rules).
> 
> Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
> ---

Given the NULL pointer deference report at
https://lore.kernel.org/all/79152feb-bcbc-9e3e-e776-13170ae4ef40@vigem.de/

I have added:
Reported-by: Sven Zühlsdorf <sven.zuehlsdorf@vigem.de>
And applied this one only in the series in for-6.2/upstream-fixes.

Before applying the rest I'd rather have some external reviews of this
series.

Cheers,
Benjamin

>  drivers/hid/hid-mcp2221.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index 5886543b17f3..e61dd039354b 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -1110,12 +1110,19 @@ static int mcp2221_probe(struct hid_device *hdev,
>  		return ret;
>  	}
>  
> -	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +	/*
> +	 * This driver uses the .raw_event callback and therefore does not need any
> +	 * HID_CONNECT_xxx flags.
> +	 */
> +	ret = hid_hw_start(hdev, 0);
>  	if (ret) {
>  		hid_err(hdev, "can't start hardware\n");
>  		return ret;
>  	}
>  
> +	hid_info(hdev, "USB HID v%x.%02x Device [%s] on %s\n", hdev->version >> 8,
> +			hdev->version & 0xff, hdev->name, hdev->phys);
> +
>  	ret = hid_hw_open(hdev);
>  	if (ret) {
>  		hid_err(hdev, "can't open device\n");
> @@ -1145,8 +1152,7 @@ static int mcp2221_probe(struct hid_device *hdev,
>  	mcp->adapter.retries = 1;
>  	mcp->adapter.dev.parent = &hdev->dev;
>  	snprintf(mcp->adapter.name, sizeof(mcp->adapter.name),
> -			"MCP2221 usb-i2c bridge on hidraw%d",
> -			((struct hidraw *)hdev->hidraw)->minor);
> +			"MCP2221 usb-i2c bridge");
>  
>  	ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
>  	if (ret) {
> -- 
> 2.34.1
> 

