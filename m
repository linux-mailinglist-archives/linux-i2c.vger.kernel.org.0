Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E9C31CEB9
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 18:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhBPRLt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 12:11:49 -0500
Received: from mail-lj1-f178.google.com ([209.85.208.178]:45128 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhBPRLt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 12:11:49 -0500
Received: by mail-lj1-f178.google.com with SMTP id c8so10562998ljd.12;
        Tue, 16 Feb 2021 09:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FSXYxSuAoSBiUnhjAQu5kedBHgCGKngf/yYTG79ZaFg=;
        b=BtwdSuLqj6rzB4jJ+jNBn8fkerqIdGsR6lN0w1jjZ82m5DEF3w+qPIKcXCk1rjFVzO
         D8ceTRg18IV6QLXdFOylrESUyVHV1H2XaB+GKEkNE46mNs7fYRyO5Wf5ViFnJQ8i9lnL
         oogB4AhWCEQkQZ5byeCTzKgmSX3AkfffEDWeg9P1zT0gd3EX4bTeGZmiuO/xC3Rtoy83
         5fXo+UbE8zTyGABTt+DGvCjEthhmrux8gw8/1wUiDtUpMXssAhBe0X81bKtXHx8mYprr
         m3smDf/1179D/qCPbBNDSjifgmAtKe3/rgvoWjWvBBlsWbK55LXYCjco0xLE6+/cG8x8
         0Mpw==
X-Gm-Message-State: AOAM530cCkX3koYvRrhOz/NFtkiRzBa0isFiWUmAThkqmZZ2vS00reWL
        M0CTitqbGHNEq7CndIPdTIA=
X-Google-Smtp-Source: ABdhPJyaZb/hUDVaLwDIuaICrzeLokXw4yqkEg1I3QUpBwx/MKBPav/hPxELwBbU4b/3xj1lmt1J+Q==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr12511995ljl.483.1613495454793;
        Tue, 16 Feb 2021 09:10:54 -0800 (PST)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id v24sm4124110ljg.27.2021.02.16.09.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 09:10:53 -0800 (PST)
Date:   Tue, 16 Feb 2021 18:10:52 +0100
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Documentation: devres: Add
 pcim_alloc_irq_vectors()
Message-ID: <YCv8nCX0ZdAb+CHm@rocinante>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <20210216160249.749799-3-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210216160249.749799-3-zhengdejin5@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dejin,

Thank you again for all the work here!

> Add pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(). introducing this function can simplify
> the error handling path in many drivers.

The second sentence should most likely start with a capital letter.

Having said that, people might ask - how does it simplify the error
handling path?

You might have to back this with a line of two to explain how does the
change achieved that, so that when someone looks at the commit message
it would be clear what the benefits of the change were.

Reviewed-by: Krzysztof Wilczyński <kw@linux.com>

Krzysztof
