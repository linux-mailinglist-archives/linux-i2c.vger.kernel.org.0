Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC1476BE9A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 22:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbjHAUlP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 16:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbjHAUlO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 16:41:14 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82531198A;
        Tue,  1 Aug 2023 13:41:13 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686ea67195dso4413487b3a.2;
        Tue, 01 Aug 2023 13:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690922473; x=1691527273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Bl4Xiaj/gTNp+4bW1mfiA5ckgUaDJxquxPMhPcUpZM=;
        b=jlaZojKdgFEWlEFsZ6o790VEFe+B7unKX6wQMZ1qOYUYSuyP+SMe0trXHncqnBBy2C
         SHlqKmPln6PK95T04W3zqx/yssvXxj8C+9q/f7JU7sbsGG+TMYaT4attq4q8Z1YvgaTs
         ycF+qLcKeDrui/rpRVvu8oLQXvfH4h8OLz1RLQyrfX7kJILUAatj0k7fwgKCm1DkGkox
         q776HZdMt0JON7iubSc/YE/dwrQqC3HDQkdbBvfAehvirYE3R5iGwgC9hRdy1nZOcP+5
         CKT3GuDST+RuOGaHz3CppLFd4mCtz8/Tf/ZX/LRHQjjMBoh3LpmAx2F0gU4x2ta9ZKxj
         /19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690922473; x=1691527273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Bl4Xiaj/gTNp+4bW1mfiA5ckgUaDJxquxPMhPcUpZM=;
        b=UpK2uGW+4IXe7H/Mejf6PGmF0ExMNI/xCnKtOFA8ZQ+fdYKd0LUjMw+yUuWH8RJJp/
         j3YdbkuN507RSpFgULhl3S6hg9g8HCio3B0HZXxECNNzRsRtljZo4I48183NXAJG+KVG
         h08oJjuwwIc1rgycaF39DTiZ6/YZTMn22ES+qxUXLmkgrsfRSVqAQWsJquE9IObEFCzB
         fIABwqEhA8dPQA7QpqOU+tzdqDpDMst9hGs7ZE0+ndhurqZDux8CBKHc7Iz/6GNZSyh3
         zNkmeOZ0TTZz4Q0G4tApinlUWlg4l5jaYAfg8rTKWVnGJXSok+fE86qCOtNl7sO8b6zp
         VU9Q==
X-Gm-Message-State: ABy/qLY8j2cMtjAstUlVr7SCp/CZOfYHNpsiPeXUGi1ge6Tjcua6Jk1r
        FbswHO8ueINfeE4GuHMEnYA=
X-Google-Smtp-Source: APBJJlFVT1Oz9is2JRudRu1MMoLLZ150rqAzMitQfJkb9gX09d47r5nar+pF90zflOKGQ5uSrt77lw==
X-Received: by 2002:a17:902:cec5:b0:1bb:d7d4:e0d with SMTP id d5-20020a170902cec500b001bbd7d40e0dmr16134296plg.64.1690922472739;
        Tue, 01 Aug 2023 13:41:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:877e:78a5:c7ac:e1d4])
        by smtp.gmail.com with ESMTPSA id jw16-20020a170903279000b001b8a7e1b116sm10820150plb.191.2023.08.01.13.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 13:41:12 -0700 (PDT)
Date:   Tue, 1 Aug 2023 13:41:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <ZMlt5SpEgawlWHoB@google.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
 <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
 <ZMlc5jHfSf/bOCe3@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMlc5jHfSf/bOCe3@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 01, 2023 at 10:28:38PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 01, 2023 at 06:03:18PM +0100, Biju Das wrote:
> > Add i2c_device_get_match_data() callback to struct bus_type().
> > 
> > While at it, introduced i2c_get_match_data_helper() to avoid code
> > duplication with i2c_get_match_data().
> 
> Have you used --patience when prepared the patch for sending?
> 
> ...
> 
> > -const void *i2c_get_match_data(const struct i2c_client *client)
> > +static const void *i2c_get_match_data_helper(const struct i2c_driver *driver,
> > +					     const struct i2c_client *client)
> >  {
> 
> > -	struct i2c_driver *driver = to_i2c_driver(client->dev.driver);
> 
> Does it make sense to remove and add an additional parameter? In one case it's
> a copy, in another it probably the same, just hidden in the code.
> 
> >  	const struct i2c_device_id *match;
> > +
> > +	match = i2c_match_id(driver->id_table, client);
> > +	if (!match)
> > +		return NULL;
> > +
> > +	return (const void *)match->driver_data;
> > +}
> > +
> > +static const void *i2c_device_get_match_data(const struct device *dev)
> > +{
> > +	/* TODO: use i2c_verify_client() when it accepts const pointer */
> > +	const struct i2c_client *client = (dev->type == &i2c_client_type) ?
> > +					  to_i2c_client(dev) : NULL;
> >  	const void *data;
> 
> > +	if (!dev->driver)
> > +		return NULL;
> 
> When can this be true?

It is not guaranteed that the function is always called on a device
bound to a driver (even though we normally expect this to be the case).

> 
> > +	data = i2c_get_match_data_helper(to_i2c_driver(dev->driver), client);
> > +	if (data)
> > +		return data;
> >  
> > -		data = (const void *)match->driver_data;
> > +	if (dev->driver->of_match_table) {
> > +		const struct of_device_id *match;
> > +
> > +		match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
> > +						  (struct i2c_client *)client);

Can we make i2c_of_match_device_sysfs() take a const pointer to a
client? Casting away constness is something that we should avoid.

> > +		if (match)
> > +			data = match->data;
> >  	}
> >  
> >  	return data;
> >  }
> 
> ...
> 
> > -static const struct of_device_id*
> > +const struct of_device_id*
> 
> While here, add a missing space after of_device_id.
> 
> ...
> 
> > +const struct of_device_id*
> 
> Ditto.
> 
> Or use below (weird) style in case it occurs more often than usual one.
> 
> > +i2c_of_match_device_sysfs(const struct of_device_id *matches,
> > +			  struct i2c_client *client);
> > +
> >  const struct of_device_id
> >  *i2c_of_match_device(const struct of_device_id *matches,
> >  		     struct i2c_client *client);
> 
> ...
> 
> > +static inline const struct of_device_id
> > +*i2c_of_match_device(const struct of_device_id *matches,
> 
> As per above.

Was it supposed to be i2c_of_match_device_sysfs()? Also, this should be
in drivers/i2c/i2c-core.h, not in public header.

Thanks.

-- 
Dmitry
