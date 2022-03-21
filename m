Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797E14E331B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Mar 2022 23:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiCUWvs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Mar 2022 18:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiCUWvK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Mar 2022 18:51:10 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93046D4CAB;
        Mon, 21 Mar 2022 15:30:56 -0700 (PDT)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl [194.29.137.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 61AEF3F769;
        Mon, 21 Mar 2022 23:20:39 +0100 (CET)
Message-ID: <ce61ffe7-ed7f-2437-91d4-3584f9e6d691@somainline.org>
Date:   Mon, 21 Mar 2022 23:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC DNM PATCH] i2c: busses: qcom-cci: Add support for passing
 data in DT
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220319200549.530387-1-konrad.dybcio@somainline.org>
 <YjiWzqK2hAopr9HB@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <YjiWzqK2hAopr9HB@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 21/03/2022 16:16, Bjorn Andersson wrote:
> On Sat 19 Mar 15:05 CDT 2022, Konrad Dybcio wrote:
>
> +devicestree@vger.kernel.org
>
>> Some vendors, such as SONY, fine-tune CCI parameters to better suit their
>> specific combinations of devices and camera sensors, mostly in order to save a
>> tiny bit more power. Add support for specifying all the CCI parameters in DT to
>> avoid adding millions of structs in the driver itself.
>>
>> ---
>> This is a ridiculously blatant RFC and PoC just to start the discussion.
>> (thus it's missing the S-o-b on purpose)
>>
>> My point is that our favourite (cough cough) phone vendor likes to
>> fine-tune every bit of the hardware and they are probably not alone
>> doing this. Moving the properties into the DT would allow for more
>> flexibility with the configuration, instead of having to add a separate
>> set of structs for each one.
>>
>> If it were to make it in any form, it would probably be much saner
>> to represent each mode as an individual subnode in the dt, specifying
>> its parameters over there (which would incidentally also allow for
>> adding more/less modes if need be), something like this:
>>
>> cci@0badbeef {
>> 	/* compatible and stuff */
>>
>> 	mode-standard {
>> 		parameter-1 = <1>;
>> 	};
>>
>> 	mode-fast {
>> 		parameter-1 = <1>;
>> 	};
>>
>> 	mode-supercustomlightspeed {
>> 		parameter-1 = <1>;
>> 		parameter-2 = <1337>;
>> 	};
> We put clock-frequency in the i2c bus node today, doesn't this serve the
> same purpose, but with more details? Why would one want to specify the
> timing details for each mode and then select one?

As far as I understand, imaging sensors can choose different modes under 
different bandwidth requirements, in order to save power where possible 
and consume the full bandwidth where necessary. The parameters can be 
changed to better suit the individual board designs.


> Perhaps I'm
> missing some detail here?
>
>
> Are these timing details specified per bus in the CCI, or are the
> settings shared between the two buses of the controller?

The details are shared between both buses, as is the case in the current 
state of the driver and downstream.


By the way, I got word that at least Lumias also have some tweaks done 
to these values.


Konrad


>
> Regards,
> Bjorn
>
>> };
>>
>> What are your thoughts about this, and do you think the form shown above
>> (and probably not the one in the patch) would be fitting, or is there a
>> better approach to this?
>>
>>   drivers/i2c/busses/i2c-qcom-cci.c | 274 ++++++++++++++++++++++++++++++
>>   1 file changed, 274 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
>> index 07c11e2a446d..6754b5d11c52 100644
>> --- a/drivers/i2c/busses/i2c-qcom-cci.c
>> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
>> @@ -117,6 +117,7 @@ struct cci_master {
>>   };
>>   
>>   struct cci_data {
>> +	bool read_params_from_dt;
>>   	unsigned int num_masters;
>>   	struct i2c_adapter_quirks quirks;
>>   	u16 queue_size[NUM_QUEUES];
>> @@ -520,11 +521,20 @@ static const struct dev_pm_ops qcom_cci_pm = {
>>   	SET_RUNTIME_PM_OPS(cci_suspend_runtime, cci_resume_runtime, NULL)
>>   };
>>   
>> +static struct cci_data cci_dt_data = {
>> +	.read_params_from_dt = true,
>> +	.quirks = {},
>> +	.params[I2C_MODE_STANDARD] = {},
>> +	.params[I2C_MODE_FAST] = {},
>> +	.params[I2C_MODE_FAST_PLUS] = {},
>> +};
>> +
>>   static int cci_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	unsigned long cci_clk_rate = 0;
>>   	struct device_node *child;
>> +	struct cci_data *dt_data;
>>   	struct resource *r;
>>   	struct cci *cci;
>>   	int ret, i;
>> @@ -540,6 +550,267 @@ static int cci_probe(struct platform_device *pdev)
>>   	if (!cci->data)
>>   		return -ENOENT;
>>   
>> +	if (cci->data->read_params_from_dt) {
>> +		dt_data = &cci_dt_data;
>> +
>> +		/* CCI params */
>> +		ret = of_property_read_u32(dev->of_node, "num-masters", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading num-masters from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->num_masters = val;
>> +
>> +		ret = of_property_read_u16_array(dev->of_node, "queue-size", dt_data->queue_size,
>> +			(size_t)&dt_data->num_masters);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading queue-size from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +
>> +		if (ARRAY_SIZE(dt_data->queue_size) != dt_data->num_masters) {
>> +			dev_err(dev, "num-masters doesn't match the number of queue-size elements!");
>> +			return -EINVAL;
>> +		}
>> +
>> +		ret = of_property_read_u32(dev->of_node, "max-write-len", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading max-write-len from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->quirks.max_write_len = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "max-read-len", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading max-read-len from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->quirks.max_read_len = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "cci-clk-rate", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading cci-clk-rate from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->cci_clk_rate = (unsigned long)val;
>> +
>> +		/* STANDARD mode params */
>> +		ret = of_property_read_u32(dev->of_node, "thigh-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading thigh-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].thigh = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tlow-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tlow-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].tlow = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tsu-sto-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tsu-sto-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].tsu_sto = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tsu-sta-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tsu-sta-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].tsu_sta = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "thd-dat-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading thd-dat-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].thd_dat = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "thd-sta-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading thd-sta-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].thd_sta = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tbuf-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tbuf-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].tbuf = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "scl-stretch-en-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading scl-stretch-en-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].scl_stretch_en = (u8)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "trdhld-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading trdhld-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].trdhld = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tsp-standard", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tsp-standard from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_STANDARD].tsp = (u16)val;
>> +
>> +		/* FAST mode params */
>> +		ret = of_property_read_u32(dev->of_node, "thigh-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading thigh-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].thigh = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tlow-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tlow-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].tlow = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tsu-sto-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tsu-sto-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].tsu_sto = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tsu-sta-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tsu-sta-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].tsu_sta = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "thd-dat-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading thd-dat-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].thd_dat = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "thd-sta-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading thd-sta-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].thd_sta = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tbuf-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tbuf-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].tbuf = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "scl-stretch-en-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading scl-stretch-en-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].scl_stretch_en = (u8)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "trdhld-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading trdhld-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].trdhld = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tsp-fast", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tsp-fast from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST].tsp = (u16)val;
>> +
>> +		/* FAST_PLUS mode params */
>> +		ret = of_property_read_u32(dev->of_node, "thigh-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading thigh-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].thigh = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tlow-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tlow-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].tlow = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tsu-sto-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tsu-sto-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].tsu_sto = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tsu-sta-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tsu-sta-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].tsu_sta = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "thd-dat-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading thd-dat-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].thd_dat = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "thd-sta-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading thd-sta-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].thd_sta = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tbuf-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tbuf-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].tbuf = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "scl-stretch-en-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading scl-stretch-en-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].scl_stretch_en = (u8)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "trdhld-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading trdhld-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].trdhld = (u16)val;
>> +
>> +		ret = of_property_read_u32(dev->of_node, "tsp-fast-plus", &val);
>> +		if (ret) {
>> +			dev_err(dev, "Error reading tsp-fast-plus from DT, ret = %d", ret);
>> +			return ret;
>> +		}
>> +		dt_data->params[I2C_MODE_FAST_PLUS].tsp = (u16)val;
>> +
>> +		/* Let's ship it! */
>> +		cci->data = dt_data;
>> +	}
>> +
>>   	for_each_available_child_of_node(dev->of_node, child) {
>>   		u32 idx;
>>   
>> @@ -818,6 +1089,9 @@ static const struct cci_data cci_msm8994_data = {
>>   };
>>   
>>   static const struct of_device_id cci_dt_match[] = {
>> +	{ .compatible = "qcom,cci", .data = &cci_dt_data },
>> +
>> +	/* Legacy compatibles for older DTs */
>>   	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
>>   	{ .compatible = "qcom,msm8994-cci", .data = &cci_msm8994_data},
>>   	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
>> -- 
>> 2.35.1
>>
