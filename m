Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3D64291CA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 16:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238730AbhJKObF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 10:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238452AbhJKObC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 10:31:02 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D6AC018D8B;
        Mon, 11 Oct 2021 07:08:46 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id b5-20020a4ac285000000b0029038344c3dso5408252ooq.8;
        Mon, 11 Oct 2021 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QMmmEXHy/NpgufeIi5WgngfmXDasNyOrC+OVqr25rEM=;
        b=f4b3tz9nZ/0kbHVmFTYLB3mYVpFpHi9XgfXven0KSPpjUYEFl0UYiuoWBsZUOTGRBc
         eCaLRLlmvKQIz2aZ3s1FjbQEsUcbwqyZdN+v9Kmy1jQXDV+lkLhgep/4Fcz4SR6oo+IQ
         jKYvk0km/i+vLd9grAOiVIslSfC5bOkSUJgM3SxX2K51uF4L0fXkvrHPcvgkvX7mEFm/
         4adrIJDRl8mGlaqxIvviins/RawxV5g3Sq2fln16f15Z23SzzdFBeaRnmfMDuT9XN8Oh
         alU/aL3moXpzvp66x9JusUiErAf1+M9p5TSLpe8FGdgABVircXrCAXy2jNQQRG4iiFCj
         Tw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=QMmmEXHy/NpgufeIi5WgngfmXDasNyOrC+OVqr25rEM=;
        b=ukyrPTJdnPe2kPDH2DNzU8KQ1ZshtDC73T2dEXhtcHeddIk5x8oazvV2snSWsYx2hM
         VSHlYj5cGI/nRvdAtb775xHwX54GOpPnayUECldKCCKDsqtJW/XU/bEpnORKWYdG/yey
         FCJ1Y4T4UCtLmIJHtvI4Sq8C0e9obqDn2rytfAd5ZybQyctwwk9PEwbey1Iey3QfGGr1
         OnhHLeRfJRW7yPXgg5G9wjsQMxKBMxoH8Ghgz43/bLgUAfP4tI3tTjuIpAblo5Uh6Uda
         MWPBJsYeB/2C0D9FzoC5HLx7tUnZ5fStYKktVpRo9yQBNntoHzFnEbLj6Ae+l3Bsv8hy
         Ll3Q==
X-Gm-Message-State: AOAM531KADtsvo/j+Uinj9FNkMT9wHOoWO20Qt3lK11iilFyNew9/xL7
        0E6YMfwdcPe7A3A38uyYsDI=
X-Google-Smtp-Source: ABdhPJwkC5cv0I+zxyeKV4viWCopnvb/4K4pDsGogY0cKTlF0Zsfg1YERZbYsbm0Nc0/V4I2ezl6kw==
X-Received: by 2002:a4a:2f0f:: with SMTP id p15mr4884272oop.44.1633961325633;
        Mon, 11 Oct 2021 07:08:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e25sm886864oot.38.2021.10.11.07.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 07:08:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 11 Oct 2021 07:08:44 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cristian Marussi <cristian.marussi@arm.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 07/14] mailbox: pcc: Use PCC mailbox channel pointer
 instead of standard
Message-ID: <20211011140844.GA1449475@roeck-us.net>
References: <20210917133357.1911092-1-sudeep.holla@arm.com>
 <20210917133357.1911092-8-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917133357.1911092-8-sudeep.holla@arm.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 17, 2021 at 02:33:50PM +0100, Sudeep Holla wrote:
> Now that we have all the shared memory region information populated in
> the pcc_mbox_chan, let us propagate the pointer to the same as the
> return value to pcc_mbox_request channel.
> 
> This eliminates the need for the individual users of PCC mailbox to
> parse the PCCT subspace entries and fetch the shmem information. This
> also eliminates the need for PCC mailbox controller to set con_priv to
> PCCT subspace entries. This is required as con_priv is private to the
> controller driver to attach private data associated with the channel and
> not meant to be used by the mailbox client/users.
> 
> Let us convert all the users of pcc_mbox_{request,free}_channel to use
> new interface.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/acpi/cppc_acpi.c               | 43 ++++++------------
>  drivers/hwmon/xgene-hwmon.c            | 35 ++++++--------

Acked-by: Guenter Roeck <linux@roeck-us.net>

>  drivers/i2c/busses/i2c-xgene-slimpro.c | 33 +++++---------
>  drivers/mailbox/pcc.c                  | 63 ++++++++------------------
>  include/acpi/pcc.h                     | 12 ++---
>  5 files changed, 64 insertions(+), 122 deletions(-)
> 
> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> index e195123e26c0..aa6623bd3f00 100644
> --- a/drivers/acpi/cppc_acpi.c
> +++ b/drivers/acpi/cppc_acpi.c
> @@ -43,7 +43,7 @@
>  #include <acpi/cppc_acpi.h>
>  
>  struct cppc_pcc_data {
> -	struct mbox_chan *pcc_channel;
> +	struct pcc_mbox_chan *pcc_channel;
>  	void __iomem *pcc_comm_addr;
>  	bool pcc_channel_acquired;
>  	unsigned int deadline_us;
> @@ -295,7 +295,7 @@ static int send_pcc_cmd(int pcc_ss_id, u16 cmd)
>  	pcc_ss_data->platform_owns_pcc = true;
>  
>  	/* Ring doorbell */
> -	ret = mbox_send_message(pcc_ss_data->pcc_channel, &cmd);
> +	ret = mbox_send_message(pcc_ss_data->pcc_channel->mchan, &cmd);
>  	if (ret < 0) {
>  		pr_err("Err sending PCC mbox message. ss: %d cmd:%d, ret:%d\n",
>  		       pcc_ss_id, cmd, ret);
> @@ -308,10 +308,10 @@ static int send_pcc_cmd(int pcc_ss_id, u16 cmd)
>  	if (pcc_ss_data->pcc_mrtt)
>  		pcc_ss_data->last_cmd_cmpl_time = ktime_get();
>  
> -	if (pcc_ss_data->pcc_channel->mbox->txdone_irq)
> -		mbox_chan_txdone(pcc_ss_data->pcc_channel, ret);
> +	if (pcc_ss_data->pcc_channel->mchan->mbox->txdone_irq)
> +		mbox_chan_txdone(pcc_ss_data->pcc_channel->mchan, ret);
>  	else
> -		mbox_client_txdone(pcc_ss_data->pcc_channel, ret);
> +		mbox_client_txdone(pcc_ss_data->pcc_channel->mchan, ret);
>  
>  end:
>  	if (cmd == CMD_WRITE) {
> @@ -493,46 +493,33 @@ EXPORT_SYMBOL_GPL(acpi_get_psd_map);
>  
>  static int register_pcc_channel(int pcc_ss_idx)
>  {
> -	struct acpi_pcct_hw_reduced *cppc_ss;
> +	struct pcc_mbox_chan *pcc_chan;
>  	u64 usecs_lat;
>  
>  	if (pcc_ss_idx >= 0) {
> -		pcc_data[pcc_ss_idx]->pcc_channel =
> -			pcc_mbox_request_channel(&cppc_mbox_cl,	pcc_ss_idx);
> +		pcc_chan = pcc_mbox_request_channel(&cppc_mbox_cl, pcc_ss_idx);
>  
> -		if (IS_ERR(pcc_data[pcc_ss_idx]->pcc_channel)) {
> +		if (IS_ERR(pcc_chan)) {
>  			pr_err("Failed to find PCC channel for subspace %d\n",
>  			       pcc_ss_idx);
>  			return -ENODEV;
>  		}
>  
> -		/*
> -		 * The PCC mailbox controller driver should
> -		 * have parsed the PCCT (global table of all
> -		 * PCC channels) and stored pointers to the
> -		 * subspace communication region in con_priv.
> -		 */
> -		cppc_ss = (pcc_data[pcc_ss_idx]->pcc_channel)->con_priv;
> -
> -		if (!cppc_ss) {
> -			pr_err("No PCC subspace found for %d CPPC\n",
> -			       pcc_ss_idx);
> -			return -ENODEV;
> -		}
> -
> +		pcc_data[pcc_ss_idx]->pcc_channel = pcc_chan;
>  		/*
>  		 * cppc_ss->latency is just a Nominal value. In reality
>  		 * the remote processor could be much slower to reply.
>  		 * So add an arbitrary amount of wait on top of Nominal.
>  		 */
> -		usecs_lat = NUM_RETRIES * cppc_ss->latency;
> +		usecs_lat = NUM_RETRIES * pcc_chan->latency;
>  		pcc_data[pcc_ss_idx]->deadline_us = usecs_lat;
> -		pcc_data[pcc_ss_idx]->pcc_mrtt = cppc_ss->min_turnaround_time;
> -		pcc_data[pcc_ss_idx]->pcc_mpar = cppc_ss->max_access_rate;
> -		pcc_data[pcc_ss_idx]->pcc_nominal = cppc_ss->latency;
> +		pcc_data[pcc_ss_idx]->pcc_mrtt = pcc_chan->min_turnaround_time;
> +		pcc_data[pcc_ss_idx]->pcc_mpar = pcc_chan->max_access_rate;
> +		pcc_data[pcc_ss_idx]->pcc_nominal = pcc_chan->latency;
>  
>  		pcc_data[pcc_ss_idx]->pcc_comm_addr =
> -			acpi_os_ioremap(cppc_ss->base_address, cppc_ss->length);
> +			acpi_os_ioremap(pcc_chan->shmem_base_addr,
> +					pcc_chan->shmem_size);
>  		if (!pcc_data[pcc_ss_idx]->pcc_comm_addr) {
>  			pr_err("Failed to ioremap PCC comm region mem for %d\n",
>  			       pcc_ss_idx);
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index 382ef0395d8e..30aae8642069 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -93,6 +93,7 @@ struct slimpro_resp_msg {
>  struct xgene_hwmon_dev {
>  	struct device		*dev;
>  	struct mbox_chan	*mbox_chan;
> +	struct pcc_mbox_chan	*pcc_chan;
>  	struct mbox_client	mbox_client;
>  	int			mbox_idx;
>  
> @@ -652,7 +653,7 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  			goto out_mbox_free;
>  		}
>  	} else {
> -		struct acpi_pcct_hw_reduced *cppc_ss;
> +		struct pcc_mbox_chan *pcc_chan;
>  		const struct acpi_device_id *acpi_id;
>  		int version;
>  
> @@ -671,26 +672,16 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		}
>  
>  		cl->rx_callback = xgene_hwmon_pcc_rx_cb;
> -		ctx->mbox_chan = pcc_mbox_request_channel(cl, ctx->mbox_idx);
> -		if (IS_ERR(ctx->mbox_chan)) {
> +		pcc_chan = pcc_mbox_request_channel(cl, ctx->mbox_idx);
> +		if (IS_ERR(pcc_chan)) {
>  			dev_err(&pdev->dev,
>  				"PPC channel request failed\n");
>  			rc = -ENODEV;
>  			goto out_mbox_free;
>  		}
>  
> -		/*
> -		 * The PCC mailbox controller driver should
> -		 * have parsed the PCCT (global table of all
> -		 * PCC channels) and stored pointers to the
> -		 * subspace communication region in con_priv.
> -		 */
> -		cppc_ss = ctx->mbox_chan->con_priv;
> -		if (!cppc_ss) {
> -			dev_err(&pdev->dev, "PPC subspace not found\n");
> -			rc = -ENODEV;
> -			goto out;
> -		}
> +		ctx->pcc_chan = pcc_chan;
> +		ctx->mbox_chan = pcc_chan->mchan;
>  
>  		if (!ctx->mbox_chan->mbox->txdone_irq) {
>  			dev_err(&pdev->dev, "PCC IRQ not supported\n");
> @@ -702,16 +693,16 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		 * This is the shared communication region
>  		 * for the OS and Platform to communicate over.
>  		 */
> -		ctx->comm_base_addr = cppc_ss->base_address;
> +		ctx->comm_base_addr = pcc_chan->shmem_base_addr;
>  		if (ctx->comm_base_addr) {
>  			if (version == XGENE_HWMON_V2)
>  				ctx->pcc_comm_addr = (void __force *)ioremap(
>  							ctx->comm_base_addr,
> -							cppc_ss->length);
> +							pcc_chan->shmem_size);
>  			else
>  				ctx->pcc_comm_addr = memremap(
>  							ctx->comm_base_addr,
> -							cppc_ss->length,
> +							pcc_chan->shmem_size,
>  							MEMREMAP_WB);
>  		} else {
>  			dev_err(&pdev->dev, "Failed to get PCC comm region\n");
> @@ -727,11 +718,11 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  		}
>  
>  		/*
> -		 * cppc_ss->latency is just a Nominal value. In reality
> +		 * pcc_chan->latency is just a Nominal value. In reality
>  		 * the remote processor could be much slower to reply.
>  		 * So add an arbitrary amount of wait on top of Nominal.
>  		 */
> -		ctx->usecs_lat = PCC_NUM_RETRIES * cppc_ss->latency;
> +		ctx->usecs_lat = PCC_NUM_RETRIES * pcc_chan->latency;
>  	}
>  
>  	ctx->hwmon_dev = hwmon_device_register_with_groups(ctx->dev,
> @@ -757,7 +748,7 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>  	if (acpi_disabled)
>  		mbox_free_channel(ctx->mbox_chan);
>  	else
> -		pcc_mbox_free_channel(ctx->mbox_chan);
> +		pcc_mbox_free_channel(ctx->pcc_chan);
>  out_mbox_free:
>  	kfifo_free(&ctx->async_msg_fifo);
>  
> @@ -773,7 +764,7 @@ static int xgene_hwmon_remove(struct platform_device *pdev)
>  	if (acpi_disabled)
>  		mbox_free_channel(ctx->mbox_chan);
>  	else
> -		pcc_mbox_free_channel(ctx->mbox_chan);
> +		pcc_mbox_free_channel(ctx->pcc_chan);
>  
>  	return 0;
>  }
> diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
> index bba08cbce6e1..1a19ebad60ad 100644
> --- a/drivers/i2c/busses/i2c-xgene-slimpro.c
> +++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
> @@ -103,6 +103,7 @@ struct slimpro_i2c_dev {
>  	struct i2c_adapter adapter;
>  	struct device *dev;
>  	struct mbox_chan *mbox_chan;
> +	struct pcc_mbox_chan *pcc_chan;
>  	struct mbox_client mbox_client;
>  	int mbox_idx;
>  	struct completion rd_complete;
> @@ -466,7 +467,7 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
>  			return PTR_ERR(ctx->mbox_chan);
>  		}
>  	} else {
> -		struct acpi_pcct_hw_reduced *cppc_ss;
> +		struct pcc_mbox_chan *pcc_chan;
>  		const struct acpi_device_id *acpi_id;
>  		int version = XGENE_SLIMPRO_I2C_V1;
>  
> @@ -483,24 +484,14 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
>  
>  		cl->tx_block = false;
>  		cl->rx_callback = slimpro_i2c_pcc_rx_cb;
> -		ctx->mbox_chan = pcc_mbox_request_channel(cl, ctx->mbox_idx);
> -		if (IS_ERR(ctx->mbox_chan)) {
> +		pcc_chan = pcc_mbox_request_channel(cl, ctx->mbox_idx);
> +		if (IS_ERR(pcc_chan)) {
>  			dev_err(&pdev->dev, "PCC mailbox channel request failed\n");
> -			return PTR_ERR(ctx->mbox_chan);
> +			return PTR_ERR(ctx->pcc_chan);
>  		}
>  
> -		/*
> -		 * The PCC mailbox controller driver should
> -		 * have parsed the PCCT (global table of all
> -		 * PCC channels) and stored pointers to the
> -		 * subspace communication region in con_priv.
> -		 */
> -		cppc_ss = ctx->mbox_chan->con_priv;
> -		if (!cppc_ss) {
> -			dev_err(&pdev->dev, "PPC subspace not found\n");
> -			rc = -ENOENT;
> -			goto mbox_err;
> -		}
> +		ctx->pcc_chan = pcc_chan;
> +		ctx->mbox_chan = pcc_chan->mchan;
>  
>  		if (!ctx->mbox_chan->mbox->txdone_irq) {
>  			dev_err(&pdev->dev, "PCC IRQ not supported\n");
> @@ -512,17 +503,17 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
>  		 * This is the shared communication region
>  		 * for the OS and Platform to communicate over.
>  		 */
> -		ctx->comm_base_addr = cppc_ss->base_address;
> +		ctx->comm_base_addr = pcc_chan->shmem_base_addr;
>  		if (ctx->comm_base_addr) {
>  			if (version == XGENE_SLIMPRO_I2C_V2)
>  				ctx->pcc_comm_addr = memremap(
>  							ctx->comm_base_addr,
> -							cppc_ss->length,
> +							pcc_chan->shmem_size,
>  							MEMREMAP_WT);
>  			else
>  				ctx->pcc_comm_addr = memremap(
>  							ctx->comm_base_addr,
> -							cppc_ss->length,
> +							pcc_chan->shmem_size,
>  							MEMREMAP_WB);
>  		} else {
>  			dev_err(&pdev->dev, "Failed to get PCC comm region\n");
> @@ -561,7 +552,7 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
>  	if (acpi_disabled)
>  		mbox_free_channel(ctx->mbox_chan);
>  	else
> -		pcc_mbox_free_channel(ctx->mbox_chan);
> +		pcc_mbox_free_channel(ctx->pcc_chan);
>  
>  	return rc;
>  }
> @@ -575,7 +566,7 @@ static int xgene_slimpro_i2c_remove(struct platform_device *pdev)
>  	if (acpi_disabled)
>  		mbox_free_channel(ctx->mbox_chan);
>  	else
> -		pcc_mbox_free_channel(ctx->mbox_chan);
> +		pcc_mbox_free_channel(ctx->pcc_chan);
>  
>  	return 0;
>  }
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index f358ced827f2..453a58fda3a4 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -79,24 +79,9 @@ struct pcc_chan_info {
>  	int db_irq;
>  };
>  
> +#define to_pcc_chan_info(c) container_of(c, struct pcc_chan_info, chan)
>  static struct pcc_chan_info *chan_info;
> -
>  static struct mbox_controller pcc_mbox_ctrl = {};
> -/**
> - * get_pcc_channel - Given a PCC subspace idx, get
> - *	the respective mbox_channel.
> - * @id: PCC subspace index.
> - *
> - * Return: ERR_PTR(errno) if error, else pointer
> - *	to mbox channel.
> - */
> -static struct mbox_chan *get_pcc_channel(int id)
> -{
> -	if (id < 0 || id >= pcc_mbox_ctrl.num_chans)
> -		return ERR_PTR(-ENOENT);
> -
> -	return &pcc_mbox_channels[id];
> -}
>  
>  /*
>   * PCC can be used with perf critical drivers such as CPPC
> @@ -239,31 +224,25 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>   *		ACPI package. This is used to lookup the array of PCC
>   *		subspaces as parsed by the PCC Mailbox controller.
>   *
> - * Return: Pointer to the Mailbox Channel if successful or
> - *		ERR_PTR.
> + * Return: Pointer to the PCC Mailbox Channel if successful or ERR_PTR.
>   */
> -struct mbox_chan *pcc_mbox_request_channel(struct mbox_client *cl,
> -					   int subspace_id)
> +struct pcc_mbox_chan *
> +pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id)
>  {
>  	struct pcc_chan_info *pchan;
>  	struct device *dev = pcc_mbox_ctrl.dev;
>  	struct mbox_chan *chan;
>  	unsigned long flags;
>  
> -	/*
> -	 * Each PCC Subspace is a Mailbox Channel.
> -	 * The PCC Clients get their PCC Subspace ID
> -	 * from their own tables and pass it here.
> -	 * This returns a pointer to the PCC subspace
> -	 * for the Client to operate on.
> -	 */
> -	chan = get_pcc_channel(subspace_id);
> +	if (subspace_id < 0 || subspace_id >= pcc_mbox_ctrl.num_chans)
> +		return ERR_PTR(-ENOENT);
>  
> +	pchan = chan_info + subspace_id;
> +	chan = pchan->chan.mchan;
>  	if (IS_ERR(chan) || chan->cl) {
>  		dev_err(dev, "Channel not found for idx: %d\n", subspace_id);
>  		return ERR_PTR(-EBUSY);
>  	}
> -	pchan = chan_info + subspace_id;
>  
>  	spin_lock_irqsave(&chan->lock, flags);
>  	chan->msg_free = 0;
> @@ -285,38 +264,32 @@ struct mbox_chan *pcc_mbox_request_channel(struct mbox_client *cl,
>  		if (unlikely(rc)) {
>  			dev_err(dev, "failed to register PCC interrupt %d\n",
>  				pchan->db_irq);
> -			pcc_mbox_free_channel(chan);
> -			chan = ERR_PTR(rc);
> +			pcc_mbox_free_channel(&pchan->chan);
> +			return ERR_PTR(rc);
>  		}
>  	}
>  
> -	return chan;
> +	return &pchan->chan;
>  }
>  EXPORT_SYMBOL_GPL(pcc_mbox_request_channel);
>  
>  /**
>   * pcc_mbox_free_channel - Clients call this to free their Channel.
>   *
> - * @chan: Pointer to the mailbox channel as returned by
> - *		pcc_mbox_request_channel()
> + * @pchan: Pointer to the PCC mailbox channel as returned by
> + *	   pcc_mbox_request_channel()
>   */
> -void pcc_mbox_free_channel(struct mbox_chan *chan)
> +void pcc_mbox_free_channel(struct pcc_mbox_chan *pchan)
>  {
> -	u32 id = chan - pcc_mbox_channels;
> -	struct pcc_chan_info *pchan;
> +	struct pcc_chan_info *pchan_info = to_pcc_chan_info(pchan);
> +	struct mbox_chan *chan = pchan->mchan;
>  	unsigned long flags;
>  
>  	if (!chan || !chan->cl)
>  		return;
>  
> -	if (id >= pcc_mbox_ctrl.num_chans) {
> -		pr_debug("pcc_mbox_free_channel: Invalid mbox_chan passed\n");
> -		return;
> -	}
> -
> -	pchan = chan_info + id;
> -	if (pchan->db_irq > 0)
> -		devm_free_irq(chan->mbox->dev, pchan->db_irq, chan);
> +	if (pchan_info->db_irq > 0)
> +		devm_free_irq(chan->mbox->dev, pchan_info->db_irq, chan);
>  
>  	spin_lock_irqsave(&chan->lock, flags);
>  	chan->cl = NULL;
> diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
> index 5e510a6b8052..73e806fe7ce7 100644
> --- a/include/acpi/pcc.h
> +++ b/include/acpi/pcc.h
> @@ -20,16 +20,16 @@ struct pcc_mbox_chan {
>  
>  #define MAX_PCC_SUBSPACES	256
>  #ifdef CONFIG_PCC
> -extern struct mbox_chan *pcc_mbox_request_channel(struct mbox_client *cl,
> -						  int subspace_id);
> -extern void pcc_mbox_free_channel(struct mbox_chan *chan);
> +extern struct pcc_mbox_chan *
> +pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id);
> +extern void pcc_mbox_free_channel(struct pcc_mbox_chan *chan);
>  #else
> -static inline struct mbox_chan *pcc_mbox_request_channel(struct mbox_client *cl,
> -							 int subspace_id)
> +static inline struct pcc_mbox_chan *
> +pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id)
>  {
>  	return ERR_PTR(-ENODEV);
>  }
> -static inline void pcc_mbox_free_channel(struct mbox_chan *chan) { }
> +static inline void pcc_mbox_free_channel(struct pcc_mbox_chan *chan) { }
>  #endif
>  
>  #endif /* _PCC_H */
