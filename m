Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A4529989A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Oct 2020 22:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730837AbgJZVPh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Oct 2020 17:15:37 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43630 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730835AbgJZVPh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Oct 2020 17:15:37 -0400
Received: by mail-ot1-f68.google.com with SMTP id k68so9301230otk.10
        for <linux-i2c@vger.kernel.org>; Mon, 26 Oct 2020 14:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QmP6ommws7bD3EAxo4Z+a9iuwOjm8jdlxsVzMzZCnic=;
        b=aWCS2E3njOFgdsl/wWxPpPWRpRb5H1rNzxEFSFzSv2a+GV2SnUCj6GwNg+blzfsZSa
         HJFytxFRP/GY499T8woCGxYuyOrgkn6j2T416CubUbuedrpIIPODJWr4s9HLjAHmGSGc
         vd1H5SYbmSE4EARubMoFanLdd4XkUd1ugHXM+t5gADEOy2aCN9f5VBjUoRR1qO7mtwBA
         8EpjDWTDwacyPYBlWtUY7FPWVPF7NhJD/IlQsWf3I9Z4eqnVdrF5AMfKId6Fupd2PCW9
         CEqZqnCBSIKu1/CsS8PkPuiIfBl4FCjHvLId/uYYLvgBT3mtsrLd6IS1JcACurj0EJC/
         SVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QmP6ommws7bD3EAxo4Z+a9iuwOjm8jdlxsVzMzZCnic=;
        b=qZzW10ZNdKQRidz+sW3FgCt5mN3Hg6DKAuAC2GgU1FDpl5WPc26SwiaUUP25Gsy+oT
         7vx0zb0p9MdH1Wh9yLI6J1j1vx2r9xyl65c1wBAO7jhI0mPepS91VY26rKiYxF8O9p76
         /U3fKYGkQatacahRP9Y6XFF41fqDEP2FvnecWpZzxZ4dw11eRXaznqQUOsz6bxNozFEr
         gjgwaJGyPWZpDJwIv/7kB7Da15pXXd7RFI4zpHT7HoKX5SnkRWHnWW7rEocfTwKQEs9G
         JCbXbHT6PYLl+o4pxCA/mD8SWQsFhqO8UUMgOKtwv7OCqgJNvR7HE56iuHCUWngk+mHB
         Pe3w==
X-Gm-Message-State: AOAM532VMzni2mEtAhylYYwPSSDeaeMqYkRpER2WerFth2FHjVJ6lwD1
        tIPwRZ8KNe6NWGQeLih2yLFKHw==
X-Google-Smtp-Source: ABdhPJxgiXgtfOSSV05hV3Pfthk/o2qjlzK5rY0LNOqdG7wkBEOkQ1XK4wC4KwhzERrZZVGowdl2AQ==
X-Received: by 2002:a9d:75d6:: with SMTP id c22mr12402461otl.213.1603746936482;
        Mon, 26 Oct 2020 14:15:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h15sm4378000ots.31.2020.10.26.14.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 14:15:35 -0700 (PDT)
Date:   Mon, 26 Oct 2020 16:15:34 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
Message-ID: <20201026211534.GA4001@builder.lan>
References: <20201013212531.428538-1-dianders@chromium.org>
 <20201013142448.v2.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
 <20201026150500.GA26921@builder.lan>
 <20201026151351.GB1044@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026151351.GB1044@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 26 Oct 10:13 CDT 2020, Wolfram Sang wrote:

> 
> > Wolfram, would you like to pick this patch or would you prefer that it
> > goes together with the other two through the soc tree?
> 
> Actually, I prefer the soc tree because of the functional dependency. I
> am not aware of any pending qcom-geni patches, yet I think an immutable
> branch for me to pull in would be nice in this case. Could you provide
> one for me?
> 

Sounds good, please find the series applied on top of v5.10-rc1 at:

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/20201013212531.428538-1-dianders@chromium.org


I've merged the same into the qcom tree for 5.11.

Regards,
Bjorn
