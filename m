Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B73F2307B3
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 12:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgG1Kav (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 06:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbgG1Kav (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 06:30:51 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF5DC061794;
        Tue, 28 Jul 2020 03:30:50 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q7so20565126ljm.1;
        Tue, 28 Jul 2020 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e64gRt1McL8oFj3/qgie+MEUtDHl7yc27Ox+TPY2v1w=;
        b=UQpw3Dg2VBKkCK7p31udbkD4bwRyUahlHGrHBTN3d8xe290GQuPr9vqvRcVUGcjjmX
         ZhKQSf9sS01aMoQAUlH/DjtuNWlxsMzvViO0rHeWcnGNNHLwtg1ZieX6MNEnIu0tfxAj
         vN01FJpHJN8HorVG7AgtlLMq2LfblspGUQ0Tkw3nUcMHTDAISy1vOBctLeN11ckAqDSF
         vdihpYtv0z2ZnXqlSXe/VtiADzx46//7OEj825OnBCYxbGy4PdEHIsMSWy2koGwsSYee
         EWqvDkbkFUDSEuqyx2QOlUnE4mzqtWHBn+vyrMp6EOUyli5easKTAk2tyEAtEIjiumHQ
         mdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e64gRt1McL8oFj3/qgie+MEUtDHl7yc27Ox+TPY2v1w=;
        b=EGiwCXr+kTaJgW5lbcF7OSWDxegQXDommYTzv53P4SHjn5Yuqsu80YCZsPqr5tIWAq
         3p+8Jurz4mf1jBURmUj7fhjfCrwpUqIZP/65hhrnqswOZpUFV8klyMzYc9hBiQPfTuHK
         sCwnMb+wuvEnveBroW7B50xzhAYf39tAmIFrwFVGCf7keMqzlltOEQUBpADdxF+nUOPd
         u/e86H20XumXLI6SysBwkZvPszWoiHyKTrUyPzvFDCDdrE/73kSaaeaV8Wq3GKMWTwJ8
         uwluxHicTPTfBD1JI5N0rN44P/aQSdy1xb/2xtiY3rfbB8qKelOwCor2iafpgd/OcgLH
         /pEA==
X-Gm-Message-State: AOAM530L2f4OnU4lcgcoe99zSN1KG4QRI6imah9ifBb2nnwq5bjiDsPa
        L5vRAA5zDWFObTyWGYpqs6u8Q/TN
X-Google-Smtp-Source: ABdhPJz46tCr6CW+PTJsXEbxKg9+0sMlL264bMhMsnNpyA2iOhGHds2jS25HqrU7xyrwFKqVUm8+WA==
X-Received: by 2002:a2e:b4bb:: with SMTP id q27mr8024317ljm.277.1595932249003;
        Tue, 28 Jul 2020 03:30:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id u9sm2884825ljk.44.2020.07.28.03.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 03:30:48 -0700 (PDT)
Subject: Re: [RFC PATCH v5 13/14] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-14-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c3d40261-9d77-3634-3e04-f20efad9d3d8@gmail.com>
Date:   Tue, 28 Jul 2020 13:30:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595883452-17343-14-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.07.2020 23:57, Sowjanya Komatineni пишет:
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
>  	subdev = on ? src_subdev : csi_subdev;
>  	ret = v4l2_subdev_call(subdev, video, s_stream, on);
> -	if (ret < 0 && ret != -ENOIOCTLCMD)
> +	if (ret < 0 && ret != -ENOIOCTLCMD) {

I assume -ENOIOCTLCMD means that camera wasn't turned ON, so why
-ENOIOCTLCMD is special?

> +		if (on && csi_chan->mipi)
> +			tegra_mipi_cancel_calibration(csi_chan->mipi);
>  		return ret;
> +	}
> +
> +	if (on && csi_chan->mipi) {

Does finish_calibration() really need to be called for ret=-ENOIOCTLCMD?

Shouldn't it be cancel_calibration( for the -ENOIOCTLCMD?

> +		ret = tegra_mipi_finish_calibration(csi_chan->mipi);
> +		if (ret < 0)
> +			dev_err(csi_chan->csi->dev,
> +				"MIPI calibration failed: %d\n", ret);

Doesn't v4l2_subdev_call(OFF) need to be invoked here on error?

> +		return ret;
> +	}
>  
>  	return 0;
>  }

