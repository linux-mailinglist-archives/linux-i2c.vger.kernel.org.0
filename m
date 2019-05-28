Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62FCD2C603
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 14:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfE1MAK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 08:00:10 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:47054 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbfE1MAK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 08:00:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id l26so14336543lfh.13
        for <linux-i2c@vger.kernel.org>; Tue, 28 May 2019 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+or866nusWv4sIZAHRqBmPt7yJXa7/be8EsGR10LEm8=;
        b=ubYDcEKknZAiavskD6nTjssl96/1BLRgbiX9tu0kzWw2OiPn7nkndmmZuiCTCznsYH
         w+uc5DK+lFRYWLgoGWWwxrdkm3iAvILMy6dX+jg/c6KhHxhlS4HytAyk1ENXHkVZi/pB
         FGWJLCG1ZC3gx9FxAxVSglbH/pMT2xTcwpdXtM0SqVM/+GTpnjENHK0GN3RwUXdKXu8k
         gHEVheyNSEBkmNZTjvFrQoo7lCstDIipQ1SbG3//OFhIlOd8CcAruJadz+6wOquoD3o5
         a0mriiXblHdQQD4cgoGgvEzm+GuZAgMMOgwsFWP3suY2xCS8GC1Qmfq5D5eTtIbv3R2g
         vhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+or866nusWv4sIZAHRqBmPt7yJXa7/be8EsGR10LEm8=;
        b=auhnC1LXZ9AauOZ6+/FXXLVXukaW0xAeSskzRHhdRrYhnjmg27G37rqLW2Cw6UGf5n
         mJ95nsY/jq1aGhNf7oWw4VnaxReXvlDc820NOydHHPv1eeQTQg0oai5/7iAztBizeo4T
         F3qGZ7ym4zIYe2MkskAhOH5J+xqBktT0wOXu8QfzZAJmJGMVfVYaVo/0k1Hs000RO8Ij
         k8y+1Eq2kemQskO7+sqQs/krAilUNUq3zwxoAIMIJzBhP8nc3gbVmGrLf+U2j19K/3Yl
         xjl242j5Qc/7Q2wxtXEs6m6OWjM7l5XBycd9s1zkSCiJqm6lTii32zy+/ymXh2rj4doZ
         3hHg==
X-Gm-Message-State: APjAAAWVZCi6+D7ETActjmwwhKnVxmWoEExl6JVVuyhwJj8DXQpuSVWY
        ADBRcoxVeWJnxMiQ95b6cl7npK5VeEs7qAsnlgg7uxF2
X-Google-Smtp-Source: APXvYqzLFHdhp4uQSAnKEAPreNUf3VQwahyZMuckb2vplOQwFm1PI26Uuu+dVvnKOnGGITChcKEIiXtOdNrDAWF9wY8=
X-Received: by 2002:a19:f60f:: with SMTP id x15mr11398039lfe.61.1559044808882;
 Tue, 28 May 2019 05:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190521082137.2889-1-wsa@the-dreams.de> <20190521082137.2889-8-wsa@the-dreams.de>
In-Reply-To: <20190521082137.2889-8-wsa@the-dreams.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 May 2019 13:59:57 +0200
Message-ID: <CACRpkdbbmqLn4BZmyZBdVTB48fL-OUsAGkpsicGft3rdDCL4pA@mail.gmail.com>
Subject: Re: [PATCH 7/8] MAINTAINERS: add I2C DT bindings to Versatile platform
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 10:21 AM Wolfram Sang <wsa@the-dreams.de> wrote:

> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
