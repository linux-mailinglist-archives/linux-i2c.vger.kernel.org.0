Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E7E6D3A6C
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Apr 2023 23:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjDBVba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Apr 2023 17:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDBVb3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Apr 2023 17:31:29 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8101C2128;
        Sun,  2 Apr 2023 14:31:28 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id b20so109968625edd.1;
        Sun, 02 Apr 2023 14:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680471087; x=1683063087;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRcdbAiOdrJ5veV0jDWcxYBST8KB/0aFbH3RrJ9CMio=;
        b=U+Brdooy/wDtRztRowqzLI7f6VBPEUm7bdD9GVfpzw7YgjmedFnsTf/OwsH9fcM4nb
         GZM0P+EVF4otlvDsK/bgfhUGYGmenGW1vwsfHqLMsM9Qt5LTFNUSPyNcXtd6tYAQhYtC
         65cXyLipR7xBQLNHL3edI/xfx6QWa9ZDnlfwntCuSMqV0ogl3umUDPkStV4/dkDI3rEG
         65IKknbSdFrzI3HYqbcZbajwJVGxjygxiEgzxSDfxOoFxwHnfLXzK9nbyl8Nedxl8Jf+
         frmW1zUP7aXXyIqrKcOgcB+u5P6OIvlgqDiyfTcMn2WyqTLmS8Sw72dbZpfwCMOmW8iq
         PYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680471087; x=1683063087;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRcdbAiOdrJ5veV0jDWcxYBST8KB/0aFbH3RrJ9CMio=;
        b=7zWsmDCmH4GpmmZzvd9Gk98P6H/JgMldO2BFQxxayrvig7o8KNeqlV9LgZxETsp843
         tvG0tuYp67D0UD1OdyReZltwxBz+bpsXvbCssxW79lzRdhRiFScOTE4WpzZ7nU1RBzx9
         Z7rZNPB5JNv/nZCuTD7hu/zO8QfG3FbzvXq7Rb4e3nyYZGO2A+ARfyTW2urlt5zkwqCG
         9GRQt02d4Km/3ZQF+HLNyTHJkC/mnZ9tJ157oBmPa+yAkBcuMD4CcMC6UYj8g9FH3ZxC
         zV34Pldc6ygq3LJsuixAuy6LOLFKCJtBbpO0NZVeqZT+z6mcHAlmbgrBsgFmHT/jrHSw
         Cokw==
X-Gm-Message-State: AAQBX9fioKJMWEksXtm93CAY6/f2JJGApAEE17iRViPKFKdqz1R8Pq9C
        poDgr5FegHBY7W13Rd82bWF4Ahs3AuOsOg==
X-Google-Smtp-Source: AKy350YftkgE+Jyfi9zAHnb/auUj/WhUFP7v5wv6uqXRd6uzVTvyhop39NrfTaokhgalk7tYkvX/IQ==
X-Received: by 2002:aa7:ccce:0:b0:501:cf67:97f3 with SMTP id y14-20020aa7ccce000000b00501cf6797f3mr31787222edt.25.1680471086959;
        Sun, 02 Apr 2023 14:31:26 -0700 (PDT)
Received: from daniel-Precision-5530 ([86.127.67.151])
        by smtp.gmail.com with ESMTPSA id k1-20020a1709062a4100b009477ba90a85sm3625500eje.69.2023.04.02.14.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 14:31:26 -0700 (PDT)
Date:   Mon, 3 Apr 2023 00:31:21 +0300
From:   Daniel Matyas <daniel.matyas23@gmail.com>
To:     linux-iio@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Creating a driver for MAX31827 temperature switch
Message-ID: <ZCn0KeOQFJclqiAK@daniel-Precision-5530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear Kernel community,

I am developing an IIO driver for a temperature switch, which communicates through I2C at Analog Devices Inc.

When implementing the event handling for the comparator mode of the device, I faced a problem: I don't know how to differentiate the underTemp event from the overTemp event. To understand better, I suggest you check out the device's data sheet for Address map (page 12), Configuration Register Definition (page 13) and OT/UT Status Bits and ALARM Pin Behavior (page 15) - https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf

I had the idea to make 2 channels with the exact same attributes, but with different indexes, so that I can store the overTemp related events on channel 0 and underTemp related events on channel 1. Even so, I don't really feel like this is the right solution. Can anyone give me some advice on this?

Also, I was suggested that I convert my driver from IIO to HWMON. Do you think that this is needed?

Yours faithfully,
Daniel Matyas
