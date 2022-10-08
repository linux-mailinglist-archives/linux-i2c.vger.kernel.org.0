Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933635F8543
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Oct 2022 14:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJHMyn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Oct 2022 08:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJHMym (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Oct 2022 08:54:42 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3E5641B;
        Sat,  8 Oct 2022 05:54:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j4so10861696lfk.0;
        Sat, 08 Oct 2022 05:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yDaaA48MR+K0ruKf3R4hni5Yg3sJUKd+v6qHUZKDWPg=;
        b=V3JzrVqCVGajxPlAANU5+j5Pt1SoJ4zZeeIZOQe91MXJ5d67QaeGNoWeLf7y68JbsD
         Z0uefgWaw0ykzXYJ/j5e/vw+GI+BtJ4cqlv1Cr15H8LZ1OXOAYvPZBpr7NKzcSFSK7HJ
         UcLBFfMC0cRmG04kRLG064hdrazENbUV4YJANAhHdsJLaj61xSxQRkHZYFHmEGAs2ypU
         aF/E/1EfRALYPD7k4ynGtqwwmxl0Cb1+QILQX6jzezZxCxwenru1A9E/OVv8Nc459lN5
         4Ik0DMZTkTBL0dduCnGcuomc5IfiRLqu8bVQPxdwS3bsNyICQdvDSqy41+mfRRLolfDs
         T/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDaaA48MR+K0ruKf3R4hni5Yg3sJUKd+v6qHUZKDWPg=;
        b=eAxB5K01wdg+JiUS7KJq0aRpWyj+oNv01DBxZBKhA8P0RdK3yfFcb3DZF6KS1fqPCY
         vHAr/+6tBN7aSNaxRyOTouoSAZaTI6Fw1hYeFcoEjS8uvwbLIr61CahLJr10O4z06ewg
         kTZWKYg69kuE2/wu6URSrLntpzqld56ATiIEJGlRmI5b5C5a612JNV3x9g69+qYi2V4T
         nUqROLVzghcb4H5wFpt7gT+qgkEdgOLT20HDfBqFHL459YND1ECa9MHUFH9vlsQpPxH6
         q5s1ML+gsmZaOCRIMZAlhyDlJhzorp2gNva+oovv9zXinsHtCKji0if1L8jDGfEmBG58
         kOrg==
X-Gm-Message-State: ACrzQf3LxvaRfLqi1CcE5ImNo8GbIKwzKUdWfh5xPiZTPcvGLCMu9z3F
        HkaC44+B24b5xXmB100X3unZIuhMCf+0Aw==
X-Google-Smtp-Source: AMsMyM7dlzFSEaKZ05RDwrVRLuR7IOvtEyvGmMRTIjzZ5YlpOh0hvwr2/k/Uw/rTpoMNK+u3eCUx/w==
X-Received: by 2002:ac2:5a5d:0:b0:4a2:3d64:8ad3 with SMTP id r29-20020ac25a5d000000b004a23d648ad3mr3518644lfn.530.1665233678990;
        Sat, 08 Oct 2022 05:54:38 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id u24-20020a2eb818000000b0026dce212f24sm714260ljo.98.2022.10.08.05.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 05:54:38 -0700 (PDT)
Date:   Sat, 8 Oct 2022 15:54:36 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v9 3/4] i2c: muxes: pca954x: Configure MAX7357 in enhanced mode
Message-ID: <20221008125436.ndj2nwesx5lgppsf@mobilestation>
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
 <20221007075354.568752-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007075354.568752-4-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 07, 2022 at 09:53:52AM +0200, Patrick Rudolph wrote:
> The MAX7357 and MAX7358 have 6 additional registers called enhanced mode
> in the following paragraphs. While the MAX7357 exposes those registers
> without a special sequence, the MAX7358 requires an unlock sequence.
> The enhanced mode allows to configure optional features which are nice to
> have on an I2C mux, but are not mandatory for it's general operation.
> 

> As I don't have a MAX7358 for testing the special unlock sequence the
> enhanced mode isn't used on the MAX7358, but it could be added later
> if required.

Not that hard to do. Just place four I2C_SMBUS_QUICK messages in a
single transfer:
S Addr Wr [A] Sr Addr Rd [A] Sr Addr Wr [A] Sr Addr Rd [A] P
it can be easily done by means of the i2c_transfer() method called
with four i2c_msg instances (Wr/Rd/Wr/Rd with zero length) passed.
See the way the quicks smbus-messages are implemented in
i2c_smbus_xfer_emulated((). Just place four if them in single array
and pass to the i2c_transfer() method.

Note some drivers may unsupport the I2C-level transfers. Also note
some adapters may unsupport the zero-length I2C-transfers. AFAIR we
had such problem with the Synopsys DW I2C controller.

> 
> The MAX7357 enhanced mode is used to configure the chip to
>  - Disable interrupts on bus locked up detection
>  - Enable bus locked-up clearing
>  - Disconnect only locked bus instead of all channels
> 
> This configuration protects the I2C tree from total failure and attempts
> to unbrick the faulty bus. It's unclear why this isn't the default
> configuration.
> 
> Tested using the MAX7357 and verified that the stalled bus is disconnected
> while the other channels remain operational.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 4b63b1eb669e..992976fa6798 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -57,6 +57,37 @@
>  
>  #define PCA954X_IRQ_OFFSET 4
>  
> +/*
> + * The MAX7357 and MAX7358 have 6 additional registers called enhanced mode
> + * in the following paragraphs. While the MAX7357 exposes those registers
> + * without a special sequence, the MAX7358 requires an unlock sequence.
> + *
> + * The first enhanced mode register called CONF allows to configure
> + * additional features.
> + */
> +#define MAX7357_REG_SWITCH				0
> +#define MAX7357_REG_CONF				1
> +#define  MAX7357_CONF_INT_ENABLE			BIT(0)
> +#define  MAX7357_CONF_FLUSH_OUT				BIT(1)
> +#define  MAX7357_CONF_RELEASE_INT			BIT(2)
> +#define  MAX7357_CONF_LOCK_UP_CLEAR_ON_READ		BIT(3)
> +#define  MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
> +#define  MAX7357_CONF_BUS_LOCKUP_DETECTION_DISABLE	BIT(5)
> +#define  MAX7357_CONF_ENABLE_BASIC_MODE			BIT(6)
> +#define  MAX7357_CONF_PRECONNECT_TEST			BIT(7)
> +
> +/*
> + * On boot the MAX735x behave like a regular MUX. Apply a fixed
> + * default configuration on MAX7357 that:
> + * - disables interrupts
> + * - sents automatically flush-out sequence on locked-up channels
> +     when a lock-up condition is detected
> + * - isolates only the locked channel instead of all channels
> + * - doesn't disable bus lock-up detection.
> + */

> +#define MAX7357_CONF_DEFAULTS (MAX7357_CONF_FLUSH_OUT | \
> +	 MAX7357_CONF_DISCON_SINGLE_CHAN)

Moving the macro definition fully to the new line might look a bit
nicer:

+#define MAX7357_CONF_DEFAULTS \
	(MAX7357_CONF_FLUSH_OUT | MAX7357_CONF_DISCON_SINGLE_CHAN)

> +
>  enum pca_type {
>  	max_7367,
>  	max_7368,
> @@ -82,6 +113,7 @@ struct chip_desc {
>  	u8 nchans;
>  	u8 enable;	/* used for muxes only */
>  	u8 has_irq;

> +	u8 maxim_enhanced_mode;

So long name.( What about a shorter version, i.e. max(im)?_enh ?

BTW how to differentiate the devices with the enhanced mode
enabled/disabled by default?

-Sergey

>  	enum muxtype {
>  		pca954x_ismux = 0,
>  		pca954x_isswi
> @@ -113,6 +145,7 @@ static const struct chip_desc chips[] = {
>  	[max_7357] = {
>  		.nchans = 8,
>  		.muxtype = pca954x_isswi,
> +		.maxim_enhanced_mode = 1,
>  		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
>  	},
>  	[max_7358] = {
> @@ -452,6 +485,7 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
>  
>  static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>  {
> +	struct i2c_adapter *adap = client->adapter;
>  	int ret;
>  
>  	if (data->idle_state >= 0)
> @@ -459,7 +493,17 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>  	else
>  		data->last_chan = 0; /* Disconnect multiplexer */
>  
> -	ret = i2c_smbus_write_byte(client, data->last_chan);
> +	if (data->chip->maxim_enhanced_mode) {
> +		if (i2c_check_functionality(adap, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
> +			ret = i2c_smbus_write_byte_data(client, data->last_chan,
> +							MAX7357_CONF_DEFAULTS);
> +		} else {
> +			dev_warn(&client->dev, "Didn't configure enhanced defaults\n");
> +			ret = i2c_smbus_write_byte(client, data->last_chan);
> +		}
> +	} else {
> +		ret = i2c_smbus_write_byte(client, data->last_chan);
> +	}
>  	if (ret < 0)
>  		data->last_chan = 0;
>  
> -- 
> 2.37.3
> 
