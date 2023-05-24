Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2070D70FDF6
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 20:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjEXSp3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 14:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjEXSp3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 14:45:29 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF2D10B
        for <linux-i2c@vger.kernel.org>; Wed, 24 May 2023 11:45:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30ab3a2c4efso502204f8f.3
        for <linux-i2c@vger.kernel.org>; Wed, 24 May 2023 11:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684953925; x=1687545925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1hMnvoeUoCZnbHrNuVsla24G5BNFJJL9beLYNSsvRM=;
        b=YgAiJ9z9ibDogJfaasDo6C5OeW3zJXF894YwJYN3ALG5HUz6zUzvaxJb5XQKWKoAdz
         XW5DBF7Mxx7u+e9qXyuqDAWLduPmpxaMXX7xhkoYrzEOrRj6DiZM3mqdi97FTDF2tE9L
         +XA6ahZqyKE4bOgMaxBZEmSSsbO1aCQI5p7faY0OGD3fHtUtCAQhqGIMLKKC+noRda/1
         PeydBbpm2NBK/l+qZ9P2s8GlVUOM9TuhRqP8ZcRX2GQ1XrP9uFVNaj2EiU4w48JFQ0ia
         jcMWyEkbiLO+2AfZ1rdz7C1I8Lu3N8rDJnY+geEwVa75I0vT60nIqOGmhJZKjKaH4Xae
         t6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684953925; x=1687545925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1hMnvoeUoCZnbHrNuVsla24G5BNFJJL9beLYNSsvRM=;
        b=BCuE0qkeEaLRrImkv5aelpNvZ/IGdsYtnf63widCxXM5JfRihwbW2YbOgjpjrfCkyh
         syAOB+nAHfFCe1sNUJDA8jYOww4o1CWPyMHhhasS1HTSk9bGJ/mOTtN4E+lAoythOuv/
         6UkhRLcEeGbCT+pS6D7W6tPu8UyGeDW55CjSYWSjmFudZbwVrfnl7YHVCa3oFMI4H8nX
         zfvNQxTMTo1zFxmaGU83wvPzP4i83rE61wOg0H8rH9RDEwMI8Pv3gwYjgV7Xsn0GIdBL
         2Uw1I/HC4bERoJn3YAxyBYckEmN9KORV7941B8YaBC1mtuaZy7H5/w7I85NZwrefawN6
         yBgQ==
X-Gm-Message-State: AC+VfDxl1eE/uvzKU5th/y9/+wSpKWGYoiSFNotpEXD94e+K2cfrezko
        ibBpFb2UPXn8PW2u2X45DepFiQ==
X-Google-Smtp-Source: ACHHUZ7I2oNSbrNDjbxamJS48zoaByuWTXyMzWRfwH3+tjta5nbySmVuOZM+ybhBHq45hEbKhdYWsQ==
X-Received: by 2002:adf:f108:0:b0:2dd:11b8:8aa9 with SMTP id r8-20020adff108000000b002dd11b88aa9mr554531wro.15.1684953924882;
        Wed, 24 May 2023 11:45:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c228a00b003f42461ac75sm3182088wmf.12.2023.05.24.11.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 11:45:22 -0700 (PDT)
Date:   Wed, 24 May 2023 21:45:17 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Wang Zhang <silver_code@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: ocores: use devm_ managed clks
Message-ID: <4fef4e18-e924-41f5-863f-df488131708a@kili.mountain>
References: <5572a733.abc0.18846f13b0b.Coremail.m202171703@hust.edu.cn>
 <20230524154318.2259-1-silver_code@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524154318.2259-1-silver_code@hust.edu.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 24, 2023 at 11:43:18PM +0800, Wang Zhang wrote:
> While it is not entirely clear why the original author implemented this
> behavior, there may have been certain circumstances or issues that were not
> apparent to us.

This is an easy to answer question.  :P  Those are fancy new functions
which weren't available at the time.

regards,
dan carpenter

