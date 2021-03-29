Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FAE34CE5B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 12:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbhC2K7O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 06:59:14 -0400
Received: from mail-ej1-f43.google.com ([209.85.218.43]:39647 "EHLO
        mail-ej1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbhC2K6p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 06:58:45 -0400
Received: by mail-ej1-f43.google.com with SMTP id ce10so18742762ejb.6;
        Mon, 29 Mar 2021 03:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rPzi8baWxuo9+wpgrr50Rp9mtB3iFH2EgoAPuuiN1So=;
        b=X3vuxyvqLIiuwElVxLnq72HiRT1lfpCkkFVPIeFDh9ds056uinGehgoFscns1CMwSh
         eMdo8qy5UnUZjT0agR0ZfsFfEMp8NquN5EpT+BTo7bNw1ysn0Z3vwXJjbf0CQQMk+1yS
         so4I+W3ovT7zq+foAfplpi5NHJORRYvonu4AZE9UdidfEUnaSUVOZ3r3+sQi/RsNObmD
         yb4Qm8XqK13r8DeHq/nWbnAx93Ur0IDhe/6GtSQR6BBTVjUl+AMTpFnXHYTgDGc5S0M9
         VxaFP8d48CdQ157HR6qNmA1Xezo8pKSLLGq+EkiUFF2FhIBhZKWlWJR1q9daompqUOxO
         RW7Q==
X-Gm-Message-State: AOAM5305YllcwJjG6SK8OHXwYeIA9OKWq153h7/Q8GK2n4gbOwnq1wAt
        1a3UvTCQtKcCMKy+aaZ+EjU+2yN6ne0=
X-Google-Smtp-Source: ABdhPJzfaibMIhl3lOC+ePs81Oz3vpASniZ+7CvnyFk+l61I8YYi69LuxSqFlIXKvMoWfhiQSdJdEw==
X-Received: by 2002:a17:906:2551:: with SMTP id j17mr27816592ejb.441.1617015522619;
        Mon, 29 Mar 2021 03:58:42 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id f3sm7990727ejd.42.2021.03.29.03.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 03:58:41 -0700 (PDT)
Subject: Re: [PATCH 05/12] ARM: s3c: mini2440: Constify the software node
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-6-heikki.krogerus@linux.intel.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <709e434f-9e35-bdd1-7785-1938b2fb80ee@kernel.org>
Date:   Mon, 29 Mar 2021 12:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329105047.51033-6-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29/03/2021 12:50, Heikki Krogerus wrote:
> Additional device properties are always just a part of a
> software fwnode. If the device properties are constant, the
> software node can also be constant.
> 
Hi,

Thanks for your work.

I did not get the cover letter nor other patches from this set and I
don't see how the i2c uses the swnode. This makes difficult to judge
whether this looks reasonable. At least without the context the title
looks misleading - you add software_node or change to use software_node
instead of constifying it.


Best regards,
Krzysztof
