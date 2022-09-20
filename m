Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB32D5BE2B1
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 12:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiITKHU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 06:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiITKHM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 06:07:12 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D20361138;
        Tue, 20 Sep 2022 03:07:10 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FCC4169C;
        Tue, 20 Sep 2022 03:07:16 -0700 (PDT)
Received: from [10.57.18.118] (unknown [10.57.18.118])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53F333F73B;
        Tue, 20 Sep 2022 03:07:07 -0700 (PDT)
Message-ID: <5ef51421-e6b0-edd5-6b6e-439b47b794a8@arm.com>
Date:   Tue, 20 Sep 2022 11:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [BUG] ls1046a: eDMA does not transfer data from I2C
Content-Language: en-GB
To:     Sean Anderson <sean.anderson@seco.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc:     Li Yang <leoyang.li@nxp.com>, Peng Ma <peng.ma@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, Robin Gong <yibin.gong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joy Zou <joy.zou@nxp.com>, linux-media@vger.kernel.org
References: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022-09-19 23:24, Sean Anderson wrote:
> Hi all,
> 
> I discovered a bug in either imx_i2c or fsl-edma on the LS1046A where no
> data is read in i2c_imx_dma_read except for the last two bytes (which
> are not read using DMA). This is perhaps best illustrated with the
> following example:
> 
> # hexdump -C /sys/bus/nvmem/devices/0-00540/nvmem
> [  308.914884] i2c i2c-0: ffff000809380000 0x0000000889380000 0x00000000f5401000 ffff000075401000
> [  308.923529] src= 2180004 dst=f5401000 attr=   0 soff=   0 nbytes=1 slast=       0
> [  308.923529] citer=  7e biter=  7e doff=   1 dlast_sga=       0
> [  308.923529] major_int=1 disable_req=1 enable_sg=0
> [  308.942113] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[4]: submitted
> [  308.974049] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[4]: marked complete
> [  308.981339] i2c i2c-0: ffff000809380000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
> [  309.002226] i2c i2c-0: ffff000075401000 = [2e 2e 2f 2e 2e 2f 2e 2e 2f 64 65 76 69 63 65 73 2f 70 6c 61 74 66 6f 72 6d 2f 73 6f 63 2f 32 31 38 30 30 30 30 2e 69 32 63 2f 69 32 63 2d 30 2f 30 2d 30 30 35 34 2f 30 2d 30 30 35 34 30 00 00]
> [  309.024649] i2c i2c-0: ffff000809380080 0x0000000889380080 0x00000000f5401800 ffff000075401800
> [  309.033270] src= 2180004 dst=f5401800 attr=   0 soff=   0 nbytes=1 slast=       0
> [  309.033270] citer=  7e biter=  7e doff=   1 dlast_sga=       0
> [  309.033270] major_int=1 disable_req=1 enable_sg=0
> [  309.051633] fsl-edma 2c00000.edma: vchan 000000001b4371fc: txd 00000000d9dd26c5[5]: submitted
> [  309.083526] fsl-edma 2c00000.edma: txd 00000000d9dd26c5[5]: marked complete
> [  309.090807] i2c i2c-0: ffff000809380080 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> [  309.111694] i2c i2c-0: ffff000075401800 = [00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
> 00000000  2e 2e 2f 2e 2e 2f 2e 2e  2f 64 65 76 69 63 65 73  |../../../devices|
> 00000010  2f 70 6c 61 74 66 6f 72  6d 2f 73 6f 63 2f 32 31  |/platform/soc/21|
> 00000020  38 30 30 30 30 2e 69 32  63 2f 69 32 63 2d 30 2f  |80000.i2c/i2c-0/|
> 00000030  30 2d 30 30 35 34 2f 30  2d 30 30 35 34 30 00 00  |0-0054/0-00540..|
> 00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff ff  |................|
> 00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 ff 5b  |...............[|
> 00000100
> 
> (patch with my debug prints appended below)
> 
> Despite the DMA completing successfully, no data was copied into the
> buffer, leaving the original (now junk) contents. I probed the I2C bus
> with an oscilloscope, and I verified that the transfer did indeed occur.
> The timing between submission and completion seems reasonable for the
> bus speed (50 kHz for whatever reason).
> 
> I had a look over the I2C driver, and nothing looked obviously
> incorrect. If anyone has ideas on what to try, I'm more than willing.

Is the DMA controller cache-coherent? I see the mainline LS1046A DT 
doesn't have a "dma-coherent" property for it, but the behaviour is 
entirely consistent with that being wrong - dma_map_single() cleans the 
cache, coherent DMA write hits the still-present cache lines, 
dma_unmap_single() invalidates the cache, and boom, the data is gone and 
you read back the previous content of the buffer that was cleaned out to 
DRAM beforehand.

Robin.

> --Sean
> 
> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index 15896e2413c4..1d9d4a55d2af 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -391,6 +391,12 @@ void fsl_edma_fill_tcd(struct fsl_edma_hw_tcd *tcd, u32 src, u32 dst,
>   {
>          u16 csr = 0;
>   
> +       pr_info("src=%8x dst=%8x attr=%4x soff=%4x nbytes=%u slast=%8x\n"
> +               "citer=%4x biter=%4x doff=%4x dlast_sga=%8x\n"
> +               "major_int=%d disable_req=%d enable_sg=%d\n",
> +               src, dst, attr, soff, nbytes, slast, citer, biter, doff,
> +               dlast_sga, major_int, disable_req, enable_sg);
> +
>          /*
>           * eDMA hardware SGs require the TCDs to be stored in little
>           * endian format irrespective of the register endian model.
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 3576b63a6c03..0217f0cb1331 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -402,6 +402,9 @@ static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
>                  dev_err(dev, "DMA mapping failed\n");
>                  goto err_map;
>          }
> +       phys_addr_t bufp = virt_to_phys(msgs->buf);
> +       dev_info(dev, "%px %pap %pad %px\n", msgs->buf, &bufp,
> +                &dma->dma_buf, phys_to_virt(dma->dma_buf));
>   
>          txdesc = dmaengine_prep_slave_single(dma->chan_using, dma->dma_buf,
>                                          dma->dma_len, dma->dma_transfer_dir,
> @@ -965,6 +968,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
>                  }
>                  schedule();
>          }
> +       dev_info(dev, "%px = [%*ph]\n", msgs->buf, msgs->len, msgs->buf);
> +       dev_info(dev, "%px = [%*ph]\n", phys_to_virt(dma->dma_buf), msgs->len,
> +                phys_to_virt(dma->dma_buf));
>   
>          temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>          temp &= ~I2CR_DMAEN;
