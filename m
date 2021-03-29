Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D30334D3DE
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 17:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhC2P2R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 11:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35325 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231363AbhC2P16 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 11:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617031677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lEl3LAwrgGEoo1YTsPMMD8y2SPYPy6f5+CzBsjGXSQc=;
        b=UhCxLjReMZg2NZd96CKinNUbLf/SaloaPq7na8egfH3wXolBjkGNPuVABxGSzl/rqV8a1n
        crSqr39a7w6Nj3XgNNYUYlQp+JtxsgjvIJXvTRNS2wrp0OPuBLvIlg+aE454yp+N2qe4sM
        6cg5orJB0Jq/cua3rAJt//k5u0NJBqU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-m8h3IrgOOmetDXEVp6KS5w-1; Mon, 29 Mar 2021 11:27:55 -0400
X-MC-Unique: m8h3IrgOOmetDXEVp6KS5w-1
Received: by mail-ed1-f69.google.com with SMTP id a2so8749625edx.0
        for <linux-i2c@vger.kernel.org>; Mon, 29 Mar 2021 08:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lEl3LAwrgGEoo1YTsPMMD8y2SPYPy6f5+CzBsjGXSQc=;
        b=gQt+LJWwQ3Qizt8rRrPfTWHYnrBhbuLtg1sx7KQnkzVM0s0aHwZjz/xaUwjsDUuDHk
         NlcEeJph7zdVrHWYF1yh0N0V5KtiBZjgHkATwXMjzTNrRy2n3SrRuGSi8Q0fZQq2JBcu
         bXplrk1eK6RZNFRTpiyDaOKhb3EBuk3UXc5OVGPy4hD99lVRguvnz180NP/8OrHlwQa8
         7CTk7GsUuSxM9qKW3iWO5qWq9mraQ95rRuz59Pdvwj8/PD+spNn2CtK+/Ue4W+PURUfW
         BBEsb/ZaWa0y7ylOt2OQurKZvdB8jmzWtpm7ur8013vxJC0h/c6cnosPG3+wOvMx7hjo
         qf+A==
X-Gm-Message-State: AOAM530WuBACEMOOSyqJE41T1j9Osw2JpKxi9maBOv7DgmGzZa+EwLAt
        SL3nRTUeN34hrfyYK0Ym9F8U9viwuuyYa9n37DhawlLSf5sWReea2Y4CuyCpNFhuEoWFVHr1E9E
        fqmYutNiWKw7RoxDa13Wb
X-Received: by 2002:aa7:c450:: with SMTP id n16mr28385246edr.16.1617031674227;
        Mon, 29 Mar 2021 08:27:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSVQuSRTmU3G+DBc/8KfkXkhsielaLlUVdY52sqIrPlVilj17r2lNEShTTFfNtJLyZh9qN5g==
X-Received: by 2002:aa7:c450:: with SMTP id n16mr28385229edr.16.1617031674080;
        Mon, 29 Mar 2021 08:27:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gr16sm8587895ejb.44.2021.03.29.08.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 08:27:53 -0700 (PDT)
Subject: Re: [PATCH 06/12] platform/x86: intel_cht_int33fe_microb: Constify
 the software node
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-7-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d4d44d5-c213-1052-16a6-833a7f01a0ee@redhat.com>
Date:   Mon, 29 Mar 2021 17:27:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210329105047.51033-7-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 3/29/21 12:50 PM, Heikki Krogerus wrote:
> Additional device properties are always just a part of a
> software fwnode. If the device properties are constant, the
> software node can also be constant.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

What is the plan for merging this patch / this series ?

Regards,

Hans


> ---
>  drivers/platform/x86/intel_cht_int33fe_microb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_cht_int33fe_microb.c b/drivers/platform/x86/intel_cht_int33fe_microb.c
> index 20b11e0d9a758..673f41cd14b52 100644
> --- a/drivers/platform/x86/intel_cht_int33fe_microb.c
> +++ b/drivers/platform/x86/intel_cht_int33fe_microb.c
> @@ -35,6 +35,10 @@ static const struct property_entry bq27xxx_props[] = {
>  	{ }
>  };
>  
> +static const struct software_node bq27xxx_node = {
> +	.properties = bq27xxx_props,
> +};
> +
>  int cht_int33fe_microb_probe(struct cht_int33fe_data *data)
>  {
>  	struct device *dev = data->dev;
> @@ -43,7 +47,7 @@ int cht_int33fe_microb_probe(struct cht_int33fe_data *data)
>  	memset(&board_info, 0, sizeof(board_info));
>  	strscpy(board_info.type, "bq27542", ARRAY_SIZE(board_info.type));
>  	board_info.dev_name = "bq27542";
> -	board_info.properties = bq27xxx_props;
> +	board_info.swnode = &bq27xxx_node;
>  	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
>  
>  	return PTR_ERR_OR_ZERO(data->battery_fg);
> 

