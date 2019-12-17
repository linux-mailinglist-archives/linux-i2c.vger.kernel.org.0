Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D90B123605
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 20:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbfLQTyF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 14:54:05 -0500
Received: from mga02.intel.com ([134.134.136.20]:22025 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727492AbfLQTyF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Dec 2019 14:54:05 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 11:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; 
   d="scan'208";a="389942463"
Received: from vramados-mobl.amr.corp.intel.com (HELO [10.254.1.250]) ([10.254.1.250])
  by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 11:54:02 -0800
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: Add codec component for AD242x
 nodes
To:     Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
        lee.jones@linaro.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-12-daniel@zonque.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0565e5cd-9a6e-db65-0632-0bc1aa1d79db@linux.intel.com>
Date:   Tue, 17 Dec 2019 13:28:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191209183511.3576038-12-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/9/19 12:35 PM, Daniel Mack wrote:
> This driver makes AD242x nodes available as DAIs in ASoC topologies.
> 
> The hardware allows multiple TDM channel modes and bitdepths, but
> as these modes have influence in the timing calculations at discovery
> time, the mode in that the will be used in needs to be configured

the mode in that the <what> will be used in?

You should probably reword this for clarity.

> statically in the devicetree.

> +	if (ad242x_node_is_master(priv->node) &&
> +	   ((format & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)) {
> +		dev_err(component->dev, "master node must be clock slave\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!ad242x_node_is_master(priv->node) &&
> +	   ((format & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBM_CFM)) {
> +		dev_err(component->dev, "slave node must be clock master\n");
> +		return -EINVAL;
> +	}

It was my understanding that the master node provides the clock to the 
bus, so not sure how it could be a clock slave, and conversely how a 
slave node could provide a clock to the bus?


> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		if (priv->node->tdm_slot_size != 16)
> +			return -EINVAL;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		if (priv->node->tdm_slot_size != 32)
> +			return -EINVAL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

how does this work for PDM data?

is the PDM data packed into a regular TDM slot?

> +
> +	if (priv->pdm[index]) {
> +		if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
> +			return -EINVAL;
> +
> +		if (index == 0) {
> +			val = AD242X_PDMCTL_PDM0EN;
> +			mask = AD242X_PDMCTL_PDM0EN | AD242X_PDMCTL_PDM0SLOTS;
> +		} else {
> +			val = AD242X_PDMCTL_PDM1EN;
> +			mask = AD242X_PDMCTL_PDM1EN | AD242X_PDMCTL_PDM1SLOTS;
> +		}
> +
> +		switch (params_channels(params)) {
> +		case 1:
> +			break;
> +		case 2:
> +			val = mask;
> +			break;

A comment wouldn't hurt here...

