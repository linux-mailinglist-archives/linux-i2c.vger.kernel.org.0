Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4608E16F253
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 22:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgBYV6H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 16:58:07 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45888 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgBYV6H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 16:58:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id z5so335030lfd.12
        for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2020 13:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l14UNKjpNjQuYZhmjfTjRVuopwq0cxxjqboxtFAA730=;
        b=zrCQHi9gCz66YxnF2hympg24rZE3vGAnOusX9XgZan+xVwwqM5JJRzTze8euIri5Eb
         OiVQpjBdDo8V1pKXFy4TV6xO/LQ1JpELuXbFD295J3ftRpL7S/d3Il8hqCtWklCsppeL
         sHW8a26DucsP7/YYkR2m29T/MCLBKF6vwmvXSSJIOWSExAiZQ42/c8xnTIJitLdkpUpt
         1S9sMsctQu/3yMYE6gtxLPO+V4K6VGxPhdfpezeqiyzMpdy0ESHt6RgA7TafpLZA6MCg
         UwYiysc+j0SIBN4RdIuD45RFWG6YGJ4InPhx9fKuut8xpAsPcYTY0S4SDh7q5vPA1sci
         MQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l14UNKjpNjQuYZhmjfTjRVuopwq0cxxjqboxtFAA730=;
        b=Vp0iwlboQI53YeWzD9AdozNhrn1R5RcF38rINrh0GU8g3BNNx+beadi6bc9eyqFmq/
         A3J+OKopcXUqYnhSZG+Ahja9RJNu57VqHgIrPzSFGttSDzr4tgZ33C2G+a/XpsIwf5Li
         c2AroY+RvrEdItEv8aJ6y3pWC5sgs6ykQEb9uvag6K/sKe//ipsvgq4jeiEQkOGvcOQ8
         wD1449vllLjH0TfLAX4eOWv67iU1+rQZ9QSVPU5dwtFQajQazIMWUiYe3Xrpp54OVcp1
         6Xm4g1MuF6Aia5OfhykCqjzCePZ2C0C38meOqiU2cZ4YNZ6KBSk+J0pcpa7UMlVbiwuc
         nb4w==
X-Gm-Message-State: APjAAAXO9vCVx1fo88PLA7JiWGnCSJIXLqDL6i7gEAQ5tuPvsG8+cnw7
        tGoICsbuNHWW17lGUSSsFqpgwegtlPBxsBuq6K4SBMSaJWhXkw==
X-Google-Smtp-Source: APXvYqwIMnJQ227+ECW+YMS7zIpdZV0OB9DNX+eiTmfgbT4Mtm/oa1xfV5G+YlKfzvIeRFucQqStTYp2uSJfJE7Fwsw=
X-Received: by 2002:ac2:5499:: with SMTP id t25mr493512lfk.194.1582667885422;
 Tue, 25 Feb 2020 13:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com> <20200224151530.31713-34-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200224151530.31713-34-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Feb 2020 22:57:54 +0100
Message-ID: <CACRpkdahjUC7H2i_4fqhKqAQ5+66bqc2=Few5g7+qHoTG0nTMQ@mail.gmail.com>
Subject: Re: [PATCH v1 34/40] i2c: stu300: Use generic definitions for bus frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 4:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
