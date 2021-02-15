Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9178A31C37C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 22:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhBOVT0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 16:19:26 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:35358 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhBOVTZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Feb 2021 16:19:25 -0500
Received: by mail-wm1-f52.google.com with SMTP id n10so10588861wmq.0;
        Mon, 15 Feb 2021 13:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+yOtPINXmGSJ6zLfkkO0RDvqznsTi4WN8ebL5j1f6UQ=;
        b=ddFP+xBeSs7J0XjfrdV1940GWE0ld+YYpIGULOfb7yMhLI1f8+Si8YZiPPGeW3iyex
         b/q5MyAT/Fh0+QXTCTcN3mKzL+MSHguG7xXeLWd55ToQz72VDi9DiALxuWLpXBaF+IqT
         T/otb7sU1JRvVVhtgneaj/4Bz3lUhZ24iAW7dbeIUH9jcYIH64aGjuOXd2V/GNfPbqK2
         gssqVYKOm3q0c3XFAmDu8erTOPCtaROH1/yLJcfDqsWDa1UeNQdYnnvXuZY15CWQ00Wu
         qv25lU2yd+fjCMr7ldHwkUqdu7u5g+whn13I4URKdAlqdU1zTg4gOBNP13rG3vZmLmJO
         S4xw==
X-Gm-Message-State: AOAM532VFC+QrBrfNIB4h0rQPlKf8pdftgTNbN+i6QPNn0FnyfOfj9en
        m9eJLEilZrh4OikxUDMGbZE=
X-Google-Smtp-Source: ABdhPJwQ4P2zU30+RE0qE5BIptMnwmAnTH1/os00aNtR1fjFJJo7/ZIgoEoTzpiF/5QaIOmcYOc6eQ==
X-Received: by 2002:a05:600c:2056:: with SMTP id p22mr670780wmg.12.1613423923360;
        Mon, 15 Feb 2021 13:18:43 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id c62sm632669wme.16.2021.02.15.13.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 13:18:42 -0800 (PST)
Date:   Mon, 15 Feb 2021 22:18:41 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] Introduce pcim_alloc_irq_vectors()
Message-ID: <YCrlMXCUWwc0fM38@rocinante>
References: <20210215181550.714101-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210215181550.714101-1-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dejin,

Thank you for working on this series!

Do you have a link to the conversation that prompted addition of this
new function?  If so, then it would be nice to include a reference to it
here (as a link to http://lore.kernel.org/) in the cover letter for
reference, if possible, of course.

Generally, it would also be nice to expand on things a little bit and
explain why do you want to add this new function, and what problems does
it solve.

[...]
> Introduce pcim_alloc_irq_vectors(), a explicit device-managed version of
> pci_alloc_irq_vectors(). and use the correct name of device-managed
> function to alloc irq vectors in i2c drivers.

Did you want to use a comma, instead of a period, in the sentence
above?  You could also probably drop the word "explicit".

Krzysztof
