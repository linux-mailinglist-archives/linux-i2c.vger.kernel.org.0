Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011932C93A7
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 01:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730766AbgLAAGF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 19:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgLAAGD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 19:06:03 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6791AC0613D2;
        Mon, 30 Nov 2020 16:05:23 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id g185so618922wmf.3;
        Mon, 30 Nov 2020 16:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=A/+NbCD2nn5qNE8Byz47K7lsLQVWcJbcb8SwGxU/euw=;
        b=EquvRw5oHOExywMZZbEccBGVphHgaPj0IQeTUFgQPXSj5nCzjmZlRY11KMluJRe/mh
         vLwYdwFXB6+ltRls6DLJgp0ik9FY8zu9KVwXOC3rSqzPsk17RcGEkf7czkUXNDWseCKU
         lgpjAz/i0JqioMzMyjkoQnPQVjVMyLZDZAEucCKCY7KS8s2SA/hNspXZjMRca26ZWkQw
         qqzENmutVhpkhVkwNa1Rx0/mNlW3EGmUvzZ9siqYYbeQwyCBe9ADZwHyQ+fA3fzbDBP7
         4sDXE9gNRaZbXWYrnqaWFgQ+YZ7xrSLnFTedO1ovS4LTJiF6Y1/2oq3cZ9v8djmtcAWo
         O2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=A/+NbCD2nn5qNE8Byz47K7lsLQVWcJbcb8SwGxU/euw=;
        b=KCwghdqu53fx6gAjzHlptpuOmxI7WiKhwkj3n45BH7orCz4JWDNn6G02G3O7zl4lTx
         1uTzSGNNHGAsOfzliTTAHZn2+tiF47VO7Rb79+IHZ5pdkRjskXStVSdQrxozmKUf8vRC
         kGvl7QVTY5FuCqLmaaOEnFIbcueLnQ8JlGpQOJ45U6RIwWtLBgW+jodrqRZ/r/FuyPBh
         JW9ZLyWRpxDNxWvlrXnJAGDTirclwMoDyJyQbDEhVZoVw4o7gINBYUODLvfb3PUWh22v
         YylR0Mc+yFMCN4QcFfkJuDPIBI8PvK//Jurhe2zbr7bl3iW1MErKLvrdEKJu3mbBxCWK
         x1xA==
X-Gm-Message-State: AOAM5326SXHbWxbSlH+mzDJbaNQcg67GgJaW/TDzmpGfw0dmTkuvizIW
        dSNgL8NaKUVIdQPBl4DMS/o=
X-Google-Smtp-Source: ABdhPJxPqRD9okPxZ4LlJq6XJD+BpsNuTlSSwcNht+lZVo1Pn14ISpEdXMe3klCIsn49mGnK8tPHZA==
X-Received: by 2002:a1c:9acb:: with SMTP id c194mr280966wme.43.1606781113548;
        Mon, 30 Nov 2020 16:05:13 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id f3sm8087542wrx.10.2020.11.30.16.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 16:05:12 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130205203.GQ4351@valkosipuli.retiisi.org.uk>
 <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
 <20201130232150.GC25713@pendragon.ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <098d9b49-d42b-66d3-56ac-8c50b2ad3921@gmail.com>
Date:   Tue, 1 Dec 2020 00:05:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130232150.GC25713@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 30/11/2020 23:21, Laurent Pinchart wrote:
>>> Instead, I propose, that you add this as an option to the tps68470 driver
>>> that figures out whether the ACPI device for the tps68470 device actually
>>> describes something else, in a similar fashion you do with the cio2-bridge
>>> driver. I think it may need a separate Kconfig option albeit this and
>>> cio2-bridge cannot be used separately.
>> It actually occurs to me that that may not work (I know I called that
>> out as an option we considered, but that was a while ago actually). The
>> reason I wasn't worried about the existing tps68470 driver binding to
>> these devices is that it's an i2c driver, and these dummy devices don't
>> have an I2cSerialBusV2, so no I2C device is created by them the kernel.
>>
>> Won't that mean the tps68470 driver won't ever be probed for these devices?
> I think we can create a platform driver in that case. The same module
> can register multiple drivers (platform and I2C).
Ah, I follow. OK, that's an option then.
