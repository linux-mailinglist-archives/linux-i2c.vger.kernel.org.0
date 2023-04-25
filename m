Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6546EE36A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 15:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234307AbjDYNp4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 09:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbjDYNpv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 09:45:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B041445C;
        Tue, 25 Apr 2023 06:45:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4B7262A1B;
        Tue, 25 Apr 2023 13:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962E6C4339B;
        Tue, 25 Apr 2023 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682430341;
        bh=9L0RFEhgc5pVrEurXwJyQS6iOhvUqopnPSSKaj6qHrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l9rN0yXvw4qGwOHeti8o5qBtfLR1pBuf64qdQ83RRLdFbTYYcutmEc94K4lo9BCQG
         SyOqoxZBLPNi5/ZS7CZhbGdEXN5wu32UITol5ums0ldYHMT9iFhwUXabdmtZ0tB36w
         3lPsP2eKjxgOJuAIn1Rw44gVKrSaP8avWcNZ8eGaJ9FzILmvuQFQ0JI+mXxT9SnHQr
         I0Gxde5M8dlNSIkiH57of5qh8J1S83x4CTijHAx799ZeCABTMLQCZ/Hagk5t5PmXG3
         V5eR97+IhdE2f9tj9bU6u4TFF+/uneh1nBC14aYWjyftXr8yWYG/fTaxEOwycyL31s
         tkIajbtM3LHwA==
Date:   Tue, 25 Apr 2023 15:45:37 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc:     patrick@stwcx.xyz, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Message-ID: <20230425134537.pzsplcpkrog2552r@intel.intel>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Delphine,

On top of Guenter's comments,

[...]

> +config SENSORS_LTC4286
> +	bool "Linear Technologies LTC4286"
> +	help
> +	  If you say yes here you get hardware monitoring support for Linear
> +	  Technology LTC4286.

could you add a couple of words more here?

[...]

> +static int ltc4286_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	int ret;
> +	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> +	struct device *dev = &client->dev;
> +	struct pmbus_driver_info *info;
> +	u32 rsense;
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read manufacturer id\n");

you can use dev_err_probe() here:

	return dev_err_probe(&client->dev, err, "failed to read manufacturer id\n");

> +		return ret;
> +	}
> +
> +	/* Refer to ltc4286 datasheet page 20
> +	 * the default manufacturer id is LTC
> +	 */
> +	if (ret != LTC4286_MFR_ID_SIZE ||
> +	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> +		dev_err(&client->dev, "unsupported manufacturer id\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read manufacturer model\n");
> +		return ret;
> +	}

Is this read really needed?

Andi

[...]
