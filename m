Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D29C234548
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 14:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732942AbgGaMGq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 08:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732734AbgGaMGp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 08:06:45 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B523C061574;
        Fri, 31 Jul 2020 05:06:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t6so19247609ljk.9;
        Fri, 31 Jul 2020 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wGIEotVJMeoJNihU6O/r/OV8ckdtdoLNEofry0Bb5ZI=;
        b=Eu6LagJEiGtloI+tapn2ZSSDVFePwtRLBjkeKZCRDmhT8YehnOqPsbRtseSEUw+m0J
         7BqIQnayf8uOibZ4NIlX7MtgdppwdrRnaH8j/rPnCmykRBBS/r0ii16CW0F5PK/PjD3L
         A4RxmOxw9kT2ffT9oqYBt7bR9A0FdhPJ6DzRS12vQ7yZnXTqhU/Axf3RFyAFVCqQOcrR
         zshy6WcV4WwOQ7YmqlTz3OUYfp6u8OVM57o4OKyzl7XxyOSyzg9uHtZUXexDGNWUX4W1
         2xUICVbQSp+roZsjC1g2TQzuN/NI3HJHYc+++0kQWbiVrodYfUQv1BRaCU7XL4mjn8m0
         FhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wGIEotVJMeoJNihU6O/r/OV8ckdtdoLNEofry0Bb5ZI=;
        b=oPOQtUXtKPusTXIAskJgx8wgJYCvq5fw3fRZxa2ccSE0+cOkl1QpU2eY+/x5DSaqjD
         6FU/jwj3PGTNwrLFCx4/LUfqrCznnm8JLGBK+etXC4Jv4lA21yGBn4VQVjoedK1bQAJ0
         aZSWUXNlnVk8QVhRXtHV033OtLtJrPl/DnPK/cGVYyDNndty4dAIanjibL7fYCcgvgPd
         84ZLVBwiJxzIK5lXixEJLbAudJHQCFxtKXOe8WElvGd8Dfs0oBQGt6ziOGzXBfoMc1iy
         b3xZu/5D7MAEDd7rPcEuCHttGE2+aRyb0FEM888WN4k98+WGyYT0a+N1NrAoj6zPkusB
         3VoQ==
X-Gm-Message-State: AOAM5332w9rijTIZIFq1HrQ0KKZkmkOsGcC21lBuDjiggAJBQq+6b1FJ
        H24RQAAxcwZp2kOyVFdYRLe59CCK
X-Google-Smtp-Source: ABdhPJxk0BTj8qxc+FqtzWhzEa6QTQpNzeE5UIlC5aV2Fwy1reVwOKg+TWzTfJDz0BXs77vl+vw5bA==
X-Received: by 2002:a2e:2ac5:: with SMTP id q188mr1824671ljq.179.1596197203320;
        Fri, 31 Jul 2020 05:06:43 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id p9sm1629043ljg.76.2020.07.31.05.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 05:06:42 -0700 (PDT)
Subject: Re: [RFC PATCH v6 05/10] media: tegra-video: Separate CSI stream
 enable and disable implementations
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
 <1596186169-18729-6-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cdc22071-9e61-1098-803a-d7c674972b6f@gmail.com>
Date:   Fri, 31 Jul 2020 15:06:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596186169-18729-6-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

31.07.2020 12:02, Sowjanya Komatineni пишет:
> This patch separates implementation of CSI stream enable and disable
> into separate functions for readability.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/tegra-video/csi.c | 51 ++++++++++++++++++++++-----------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
> index fb667df..cfe6187 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -232,34 +232,53 @@ static int tegra_csi_g_frame_interval(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> -static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
> +static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
>  {
>  	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
>  	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>  	struct tegra_csi *csi = csi_chan->csi;
> -	int ret = 0;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(csi->dev);
> +	if (ret < 0) {
> +		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
> +		pm_runtime_put_noidle(csi->dev);
> +		return ret;
> +	}
>  
>  	csi_chan->pg_mode = chan->pg_mode;
> -	if (enable) {
> -		ret = pm_runtime_get_sync(csi->dev);
> -		if (ret < 0) {
> -			dev_err(csi->dev,
> -				"failed to get runtime PM: %d\n", ret);
> -			pm_runtime_put_noidle(csi->dev);
> -			return ret;
> -		}
> +	ret = csi->ops->csi_start_streaming(csi_chan);
> +	if (ret < 0)
> +		goto rpm_put;
>  
> -		ret = csi->ops->csi_start_streaming(csi_chan);
> -		if (ret < 0)
> -			goto rpm_put;
> +	return 0;
>  
> -		return 0;
> -	}
> +rpm_put:
> +	pm_runtime_put(csi->dev);
> +	return ret;
> +}
> +
> +static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
> +{
> +	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
> +	struct tegra_csi *csi = csi_chan->csi;
>  
>  	csi->ops->csi_stop_streaming(csi_chan);
>  
> -rpm_put:
>  	pm_runtime_put(csi->dev);
> +
> +	return 0;
> +}
> +
> +static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
> +{
> +	int ret;
> +
> +	if (enable)
> +		ret = tegra_csi_enable_stream(subdev);
> +	else
> +		ret = tegra_csi_disable_stream(subdev);
> +
>  	return ret;
>  }
>  
> 

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
