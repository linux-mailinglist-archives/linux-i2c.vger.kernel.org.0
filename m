Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A96F2344A7
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 13:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732618AbgGaLjF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 07:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732297AbgGaLjF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 07:39:05 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272D4C061574;
        Fri, 31 Jul 2020 04:39:05 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x9so32131332ljc.5;
        Fri, 31 Jul 2020 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e83eJTcVv/UaeyPlCsr6UUJefX33U2iVn2MgdxsKQTQ=;
        b=X9V6zA56PqyXwOT0CNOco7VPG50Pkbt7KmbI/ojIgjq+CFYp9qHMCY6bdOTnK3x3QR
         OE+41YFe8nwh73tpj+YDYVwNBrRap4JePkrUOhKd4jaWk7wSnBWCl7732Jd7H6DaGbnw
         zYZznHVkJ+wzuPxNavlP1QnUHUl4L/5CnblTm0LKK4baDeLDU7iO0MvH1d5WF49frrNV
         4s4Z7gSD9t/AK5UjBUcXCUQgwkHXsFpS5YxHjXRkueVpGgFZ19L24ENrdnL2MpZ35z0i
         bEruw/yDZ7CttkXNOu5ZFif5fmKXTFCMfyO8/YF8ZucVV6ESxnHc5KUMmUtQPSQdUUY2
         v06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e83eJTcVv/UaeyPlCsr6UUJefX33U2iVn2MgdxsKQTQ=;
        b=ej8bhhUdAkEttZUthgtmpb7y7Ex3JCulFPgGQkAJ8paI9kH47mZJIhl0AwJiyOEeuc
         1HhhJSRxoKT78T6IgcTop0IQeXeJ2+4fu1KihOh9+GxFxnSVW5bRLAfXFVrcLzFurR68
         AesxLWVL1aMSREzbRMfRaux4SKlulISWSntT4UqIu+ueuT4VXMGuRxpqdMH1ktSmIjfF
         IC9EF/bh2VvyklGE5kTEmK7CqpNMVy9aBIS41FuB3fnTXLtqyLca+4rWq+xZJYddGdQT
         NLyXzUqO9jFuTFUL52fqzrhcbWfMrYBf2ag5lJrI8l6VlmmiLwM5GWAtPjbiGXy/KChi
         S/aA==
X-Gm-Message-State: AOAM5337xIupLhJ+CJNo/dnKdOtmHk2O+bsHOERXXJQOLbuZrdNsdEwT
        lswJLbhag41NN5CDcIBqVxAWFztQ
X-Google-Smtp-Source: ABdhPJyGjMx9FtTEpEohXiAFoq57WavNYhs3eJc0pNbnjhC7LxeGw815xYO7ZEtnLAVlZoq41lXvWQ==
X-Received: by 2002:a2e:991:: with SMTP id 139mr1647045ljj.314.1596195543293;
        Fri, 31 Jul 2020 04:39:03 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id k12sm1870240lfe.68.2020.07.31.04.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 04:39:02 -0700 (PDT)
Subject: Re: [RFC PATCH v6 09/10] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
 <1596186169-18729-10-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3ac158c4-7df7-e3c1-f0e1-33e7ef017762@gmail.com>
Date:   Fri, 31 Jul 2020 14:39:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596186169-18729-10-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

31.07.2020 12:02, Sowjanya Komatineni пишет:
...
> @@ -249,13 +249,47 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
>  		return ret;
>  	}
>  
> +	if (csi_chan->mipi) {
> +		ret = tegra_mipi_enable(csi_chan->mipi);
> +		if (ret < 0) {
> +			dev_err(csi->dev,
> +				"failed to enable MIPI pads: %d\n", ret);
> +			goto rpm_put;
> +		}
> +
> +		/*
> +		 * CSI MIPI pads PULLUP, PULLDN and TERM impedances need to
> +		 * be calibrated after power on.
> +		 * So, trigger the calibration start here and results will
> +		 * be latched and applied to the pads when link is in LP11
> +		 * state during start of sensor streaming.
> +		 */
> +		ret = tegra_mipi_start_calibration(csi_chan->mipi);
> +		if (ret < 0) {
> +			dev_err(csi->dev,
> +				"failed to start MIPI calibration: %d\n", ret);
> +			goto disable_mipi;
> +		}

What would happen if CSI stream is enabled and then immediately disabled
without enabling camera sensor?

> +	}
> +
...
>  static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
>  {
>  	struct v4l2_subdev *csi_subdev, *src_subdev;
> +	struct tegra_csi_channel *csi_chan;
>  	int ret;
>  
>  	/*
> @@ -206,13 +207,30 @@ static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
>  	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>  		return 0;
>  
> +	csi_chan = v4l2_get_subdevdata(csi_subdev);
> +	/*
> +	 * TRM has incorrectly documented to wait for done status from
> +	 * calibration logic after CSI interface power on.
> +	 * As per the design, calibration results are latched and applied
> +	 * to the pads only when the link is in LP11 state which will happen
> +	 * during the sensor stream-on.
> +	 * CSI subdev stream-on triggers start of MIPI pads calibration.
> +	 * Wait for calibration to finish here after sensor subdev stream-on
> +	 * and in case of sensor stream-on failure, cancel the calibration.
> +	 */
>  	src_subdev = tegra_channel_get_remote_source_subdev(chan);

Is it possible to move the start_calibration() here?

>  	ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
>  	if (ret < 0 && ret != -ENOIOCTLCMD) {
> +		tegra_mipi_cancel_calibration(csi_chan->mipi);
>  		v4l2_subdev_call(csi_subdev, video, s_stream, false);
>  		return ret;
>  	}
>  
> +	ret = tegra_mipi_finish_calibration(csi_chan->mipi);
> +	if (ret < 0)
> +		dev_warn(csi_chan->csi->dev,
> +			 "MIPI calibration failed: %d\n", ret);
> +
>  	return 0;
>  }
>  
> 

