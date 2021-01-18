Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15A62FACBB
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 22:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438098AbhARVcw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 16:32:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438090AbhARVct (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 16:32:49 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0638C061573;
        Mon, 18 Jan 2021 13:32:08 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id 6so10516757wri.3;
        Mon, 18 Jan 2021 13:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3IxsDslcDpReoCownP1xCxAE8Z7K7L8fc04mjObgzts=;
        b=LiHdyuMRtxwFFN85BRDfMqn42rOOx2PQnpqXHn+wCW6txvyR484QC77Fo3yc9GtjJC
         JZgHnAanhhU0/wc5ytc8KoEZA0Oaef2TUx0BIe/JPBhQ0q64uDigP6NIWLmWAf1csPaV
         IV1DM3h7In/OiD8NcRLfWjI91EoPQfO6GR6MBfdmjhSbdFZaziwAZRDofdNpuv3Hiu8L
         XJnvx1JCzhS/K+rL698xb3V0WR7v6Mt31XD1ZHXc3lPv0lTO+xPgzAZEU3aO2IRVSBQn
         mJ62u+jhTuCNwYnmrHldNpE2mQ6kNN9x1C79nMuo9EC2e78wCxEmOmKw13Mc8DicbCTO
         k/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3IxsDslcDpReoCownP1xCxAE8Z7K7L8fc04mjObgzts=;
        b=hacC5/xxx9wG6f8bLy3J6BJ1bhdg0d8jPKUHqNfdCSvRn2OomgMf41Ug0e9/BrmFWF
         LRiq8uIeNojIzCsjkHuxaC8FpDjsJ0UyFO1bNWXEkJz1T2rypM+ll4AP5+R4w6ONS2eM
         TqFcpNA4RXO7MWGViz2bHS9WK6WIVAzVtjt72js+cEwaC09OY8uhFcB59asD0oOhkZ74
         d8do7oAyE8bRZseCZX/WfCFFfIWFl9PpaA8+ujtO/laUNt8rcXS9ktKf9oo0Em12S6ux
         qu9ZMHppMMV7Uh4CVBJPWM5N266k3HwQwN6Y/x0kmJUs4Ik59ODzV7IVje7xSCr1A4K5
         GRPA==
X-Gm-Message-State: AOAM531v4e0pdergupoGKX3eUSfubrabjqMn2OyBdQPQoMwxxJffWcXu
        SrG8F8cz/AbhYMopVAXCozQ=
X-Google-Smtp-Source: ABdhPJz2/YugJp7o0rq4nt9EWaD5osgjh0JyF/0i0c/fHNpFEwSdbLrHbtCXK7w/ze+rNwL0pFiC5A==
X-Received: by 2002:adf:d085:: with SMTP id y5mr1309658wrh.41.1611005527636;
        Mon, 18 Jan 2021 13:32:07 -0800 (PST)
Received: from [192.168.1.158] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id m82sm1113425wmf.29.2021.01.18.13.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 13:32:07 -0800 (PST)
Subject: Re: [PATCH v2 5/7] gpio: gpiolib-acpi: Export acpi_get_gpiod()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-6-djrscally@gmail.com>
 <20210118134502.GK4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <dc79f590-bbca-0eba-7d50-538f2b9ec42b@gmail.com>
Date:   Mon, 18 Jan 2021 21:32:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118134502.GK4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/01/2021 13:45, Andy Shevchenko wrote:
> On Mon, Jan 18, 2021 at 12:34:26AM +0000, Daniel Scally wrote:
>> I need to be able to translate GPIO resources in an acpi_device's _CRS
> 
> ACPI device's
> 
>> into gpio_descs. Those are represented in _CRS as a pathname to a GPIO
> 
> into GPIO descriptor array
> 
>> device plus the pin's index number: this function is perfect for that
>> purpose.
> 
> ...
> 
>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> 
> Wrong header. Please use gpio/consumer.h.
> 
Ack to all - thanks.
