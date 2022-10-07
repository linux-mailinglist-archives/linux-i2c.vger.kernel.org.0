Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBCD45F79FB
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Oct 2022 16:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiJGOxd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Oct 2022 10:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbiJGOxd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Oct 2022 10:53:33 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 40FBA66846;
        Fri,  7 Oct 2022 07:53:31 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E45F106F;
        Fri,  7 Oct 2022 07:53:37 -0700 (PDT)
Received: from [10.57.65.170] (unknown [10.57.65.170])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EF863F67D;
        Fri,  7 Oct 2022 07:53:28 -0700 (PDT)
Message-ID: <d95eb458-151b-0a31-0aa6-4073ea962d2c@arm.com>
Date:   Fri, 7 Oct 2022 15:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/3] arm64: tegra: Add GPCDMA support for Tegra I2C
Content-Language: en-GB
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        devicetree@vger.kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        sumit.semwal@linaro.org, wsa@kernel.org
References: <20220906144716.16274-1-akhilrajeev@nvidia.com>
 <20220906144716.16274-3-akhilrajeev@nvidia.com> <Y0AnpYeECoyQchmY@orome>
 <Y0A44EIF74bri/uu@orome>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Y0A44EIF74bri/uu@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022-10-07 15:34, Thierry Reding wrote:
> On Fri, Oct 07, 2022 at 03:20:37PM +0200, Thierry Reding wrote:
>> On Tue, Sep 06, 2022 at 08:17:15PM +0530, Akhil R wrote:
>>> Add dma properties to support GPCDMA for I2C in Tegra 186 and later
>>> chips
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> ---
>>>   arch/arm64/boot/dts/nvidia/tegra186.dtsi | 32 ++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 32 ++++++++++++++++++++++++
>>>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 32 ++++++++++++++++++++++++
>>>   3 files changed, 96 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> index 59a10fb184f8..3580fbf99091 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> @@ -672,6 +672,10 @@
>>>   		clock-names = "div-clk";
>>>   		resets = <&bpmp TEGRA186_RESET_I2C1>;
>>>   		reset-names = "i2c";
>>> +		iommus = <&smmu TEGRA186_SID_GPCDMA_0>;
>>> +		dma-coherent;
>>
>> I wonder: why do we need the iommus and dma-coherent properties here?
>> The I2C controllers are not directly accessing memory, instead it's the
>> GPCDMA via the dmas/dma-names properties. The GPCDMA already has these
>> properties set, so they seem to be useless here.
> 
> Looking at this some more, the reason why we need these is so that the
> struct device backing these I2C controllers is attached to an IOMMU and
> the DMA ops are set up correspondingly. Without these, the DMA memory
> allocated by the I2C controllers will not be mapped through the IOMMU
> and cause faults because the GPCDMA is the one that needs to access
> those.
> 
> I do recall that we have a similar case for audio where the "sound card"
> needs to have an iommus property to make sure it allocates memory
> through the same IOMMU domain as the ADMA, which is the device that ends
> up doing the actual memory accesses.
> 
> Rob, Robin, Will, do you know of a good way other than the DT workaround
> here to address this? I think ideally we would want to obtain the "DMA
> parent" of these devices so that we allocate memory for that parent
> instead of the child. We do have some existing infrastructure for this
> type of relationship with the __of_get_dma_parent() function as well as
> the interconnects property, but I wonder if that's really the right way
> to represent this.
> 
> Adding "interconnects" properties would also duplicate the "dmas"
> properties we already use to obtain the TX and RX DMA channels. One
> simple way to more accurately do this would be to reach into the DMA
> engine internals (dma_chan->device->dev) and pass that to dma_alloc_*()
> to make sure we allocate for the correct device. For audio that could be
> a bit complicated because most of that code is shared across multiple
> vendors. I couldn't find any examples where a driver would reach into
> DMA channels to allocate for the parent, so I'm wondering what other
> people do to solve this issue. Or if anyone else even has the same
> issue.

As far as I'm aware that's the correct approach, i.e. if a driver is 
using an external dmaengine then it's responsible for making DMA 
mappings for the correct DMA channel device. We ended up being a bit 
asymmetrical in that the dmaengine driver itself has to take care of its 
own mapping for the non-memory end of a transfer when an IOMMU is 
involved - that's what dma_map_resource() was created for, see pl330 and 
rcar-dmac for examples.

The only driver I have first-hand experience with in this context is 
amba-pl011, using pl330 through an SMMU on the Arm Juno board, but that 
definitely works fine without DT hacks.

Robin.

> Adding Lars-Peter for the sound/dmaengine helpers and Vinod for general
> dmaengine. Perhaps they have some thoughts on or experience with this.
> 
> Thierry
