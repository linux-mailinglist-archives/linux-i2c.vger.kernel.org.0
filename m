Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECCC316F99
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Feb 2021 20:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhBJTFi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Feb 2021 14:05:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbhBJTFV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Feb 2021 14:05:21 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD33C061793
        for <linux-i2c@vger.kernel.org>; Wed, 10 Feb 2021 11:04:33 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id z21so1697805iob.7
        for <linux-i2c@vger.kernel.org>; Wed, 10 Feb 2021 11:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=0nz0GUsbRFyNnjWojh4Sd2INZUh1Ds16k3rHdVW/EPA=;
        b=A2cdovxkIKtELi2w/FD0eh20qFrsRJ9m8bgn04wHsjX39jCePX8BZ0ZYU3gP3A7zik
         l3kisF+RrDveBqMn1qsCLEfx+RMLL9a12H4LAXL6+MbF9OEzM2yDmfeK+8PZZC9DBm4U
         N9uHrKzdNQs558nxtHzKK1/05dygx/Cgtr6eLB5ThcIUj6Eh2V3hwVt75RWafjd0Ka4I
         hVUtlZXXCUYuVnES9G97KHHRWR8B/X11fniQbqJBnXrF18cYbv56MTVzDuldeqRExmqe
         52D9+k8QuTeF6cfXyf2Nqp5VlApTaDL3yAjKggaERZMgONjnZdzZ1kv7RmvGbzclxOTR
         dhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=0nz0GUsbRFyNnjWojh4Sd2INZUh1Ds16k3rHdVW/EPA=;
        b=NMHAuMZX5HZV9b7CxbBnx7mJ5B+cyem4pdocKP6h5pApu3yTHaRvOhwZ+P7fGvxe39
         Rvj0rPHKNeSsGdVUmT3DLsQ28fF3v+GGsC+TN6rXgnRg+F565rtIulehQYdSdMaHdgy+
         pJbe5gfQd44ugYJqVqYpQSwmjHcc7CvTP2svoBXDni2rQkR83ckHyHqKVOuET1xt5C2C
         aQBC46UH+2k5dWShfK0ftp0X+/D0HuJsIzjqg52lGDMx1taUC2tCgBKSbU3fDKO7ffCM
         rgjN/SiUpOQKOowrdMe8BJyk7HDCXaF1FrPd74zVDa9YmAFMMzvIONsz86QRO2cndUMH
         ktyA==
X-Gm-Message-State: AOAM533BWXUi4Q0l7NJT5cET58THGjyQkoQiAgw0IvKAhWjzxB87cE+f
        KBziP9twhcWdGMz9DMpBlBojRh6D+UXUG3a5w3VZYGHYzxNWTg==
X-Google-Smtp-Source: ABdhPJwCLNIQIGoplQHAEFgLkPQrA0HTTzwwWSkq3vsWElwg9LOHRWmF6/PHGXM8tavuVUtm9t7D43llTsjRuR3EJSE=
X-Received: by 2002:a05:6638:58:: with SMTP id a24mr4910542jap.40.1612983872917;
 Wed, 10 Feb 2021 11:04:32 -0800 (PST)
MIME-Version: 1.0
From:   Alex Qiu <xqiu@google.com>
Date:   Wed, 10 Feb 2021 11:04:22 -0800
Message-ID: <CAA_a9x+ysAxT6T11S_M4pKenq2vDO762nnXUvAuXOCL7S9ozxg@mail.gmail.com>
Subject: Kernel Doc on Navigating I2C Sysfs for I2C Topology
To:     peda@axentia.se, Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter and Wolfram,

I'm looking for some documentation online to guide hardware engineers
on how to find out what logical I2C bus number to use for i2ctools in
sysfs when they know the physical I2C topology (BMC physical bus
number and MUX channels). I read through the doc under
Documentation/i2c/, but didn't find any. I didn't find much on this by
searching the Internet, either.

Is it some doc that I can add to Documentation/i2c/ or
Documentation/i2c/i2c-topology.rst? Any suggestions or thoughts?

Thank you!

- Alex Qiu
