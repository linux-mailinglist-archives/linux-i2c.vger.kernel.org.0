Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE63D35B08D
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 23:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234439AbhDJVEp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 17:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbhDJVEp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 17:04:45 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A5FC06138A;
        Sat, 10 Apr 2021 14:04:30 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 18so10507657edx.3;
        Sat, 10 Apr 2021 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J8CpfW9tNNdOnyqAlN5irkk8A1Y7n30r2i7u+iBINtk=;
        b=X21Jd8A0CvDlEOEBWT8BPcxmAdOlwYy3oGK3WSvgCa9/du/4XhyvAyL4IEVxcx0FsD
         J3D4x1Tsd77dTypHIi7oyZPxR5hiqgswStG6y3KltugbNwz7H476ZTU9hW/sXWZ5NpFJ
         gSoRfRUy3vwOxvlpNe98pYzS8bv9n8Lc0snUzVuAH6z+uE8UbIXBzFXScTYLMd6QW3+6
         JojbJ9sylMs8TvwyfPM1N6SJvRB1xpa+I+P+9jYqUNjVokj1CX1MjA+hkX8OmEoi5ccj
         8sP9LlYNRZnj0tr5JAS4FSOKYml1REDNIuWvtob2jF9+k8HHvHxfGCHiGPjNZiqiPEPa
         6k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J8CpfW9tNNdOnyqAlN5irkk8A1Y7n30r2i7u+iBINtk=;
        b=Q3UXOyJ0moKSB/EAPkecY94BL+VaVewlygxY6pthpwoFaj7c7RDaRwjeGhbDd5h/hE
         mAbW5KFX0bTg6sMlQ6hZlivlAabS/fTy9GQZPAMJIEI1Y4h76RCfsHo/RLLcjKvS0ekR
         dQ6jj+tGTwrLbe+oh+LLAGPp9ukH2D2DHZ/SKizM6JmthhBpGbJ/kSZbEAjJZCSZNAT6
         XyN3EbFu7jaXy2CK0nyT7aIxVQcZJ976fZ6m6yjaEi7E/BkGA2tJcfNzK3FTqGi2A1aX
         njStChwge+f6usLMKKTbJaDmMa19lCCAwI2WpPYFeuYZp/xc7Y9JgDTiR2iY7uws/sqS
         c/NA==
X-Gm-Message-State: AOAM532Ugq4oPwC/j3QGzCLa8nh3RPknoqm1Nq5pjAFeel9HITfVdBN2
        ffylue8GrdBCmyUMhiBDX2c=
X-Google-Smtp-Source: ABdhPJzDgbAQBAPprRJ4aSAmbcCupRQV7IV5a3d0M9mJDq33jZY7o0wypx6f53Pe3rfC4nYbC2oQJA==
X-Received: by 2002:a05:6402:151a:: with SMTP id f26mr23133504edw.43.1618088668722;
        Sat, 10 Apr 2021 14:04:28 -0700 (PDT)
Received: from michael-VirtualBox (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.gmail.com with ESMTPSA id ga28sm3097484ejc.82.2021.04.10.14.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 14:04:28 -0700 (PDT)
Date:   Sun, 11 Apr 2021 00:04:25 +0300
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        michael.zaidman@gmail.com
Subject: Re: [bug report] HID: ft260: add usb hid to i2c host bridge driver
Message-ID: <20210410210425.GA4073@michael-VirtualBox>
References: <YHBJRvcOSaM/b0RL@mwanda>
 <20210410122729.GA6136@michael-VirtualBox>
 <20210410153712.GQ6048@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410153712.GQ6048@kadam>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 10, 2021 at 06:37:13PM +0300, Dan Carpenter wrote:
> On Sat, Apr 10, 2021 at 03:27:29PM +0300, Michael Zaidman wrote:
> > On Fri, Apr 09, 2021 at 03:32:06PM +0300, Dan Carpenter wrote:
> > > Hello Michael Zaidman,
> > > 
> > > The patch 6a82582d9fa4: "HID: ft260: add usb hid to i2c host bridge
> > > driver" from Feb 19, 2021, leads to the following static checker
> > > warning:
> > > 
> > > 	drivers/hid/hid-ft260.c:441 ft260_smbus_write()
> > > 	error: '__memcpy()' '&rep->data[1]' too small (59 vs 255)
> > > 
> > > drivers/hid/hid-ft260.c
> > >    423  static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
> > >    424                               u8 *data, u8 data_len, u8 flag)
> > >    425  {
> > >    426          int ret = 0;
> > >    427          int len = 4;
> > >    428  
> > >    429          struct ft260_i2c_write_request_report *rep =
> > >    430                  (struct ft260_i2c_write_request_report *)dev->write_buf;
> > >    431  
> > >    432          rep->address = addr;
> > >    433          rep->data[0] = cmd;
> > >    434          rep->length = data_len + 1;
> > >    435          rep->flag = flag;
> > >    436          len += rep->length;
> > >    437  
> > >    438          rep->report = FT260_I2C_DATA_REPORT_ID(len);
> > >    439  
> > >    440          if (data_len > 0)
> > >    441                  memcpy(&rep->data[1], data, data_len);
> > >                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > Smatch says that this can be called from the i2cdev_ioctl_smbus()
> > > function.
> > 
> > Hi Dan,
> > 
> > This is an example of a false-positive static checker warning.
> > 
> > The maximum data size that the i2cdev_ioctl_smbus() can pass to the
> > i2c_smbus_xfer() is sizeof(data->block) which is (I2C_SMBUS_BLOCK_MAX + 2)
> > or 34 bytes. Thus, no need to check the data_len against 59 here.
> > 
> > > 
> > > i2cdev_ioctl_smbus()
> > >   --> i2c_smbus_xfer
> > >       --> __i2c_smbus_xfer
> > >           --> ft260_smbus_xfer
> > >               --> ft260_smbus_write
> 
> It's actually me who misunderstood the Smatch warning.  Smatch is not
> complaining about data_len, it's data->block[0] which is user
> controlled and only for the I2C_SMBUS_I2C_BLOCK_DATA command.
> 
> The call tree is the same.  I've looked at it again.  Here is how
> i2cdev_ioctl_smbus() looks like:
> 
> drivers/i2c/i2c-dev.c
>    355                  return -EINVAL;
>    356          }
>    357  
>    358          if ((size == I2C_SMBUS_BYTE_DATA) ||
>    359              (size == I2C_SMBUS_BYTE))
>    360                  datasize = sizeof(data->byte);
>    361          else if ((size == I2C_SMBUS_WORD_DATA) ||
>    362                   (size == I2C_SMBUS_PROC_CALL))
>    363                  datasize = sizeof(data->word);
>    364          else /* size == smbus block, i2c block, or block proc. call */
>    365                  datasize = sizeof(data->block);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>    366  
>    367          if ((size == I2C_SMBUS_PROC_CALL) ||
>    368              (size == I2C_SMBUS_BLOCK_PROC_CALL) ||
>    369              (size == I2C_SMBUS_I2C_BLOCK_DATA) ||
>                              ^^^^^^^^^^^^^^^^^^^^^^^^
>    370              (read_write == I2C_SMBUS_WRITE)) {
>    371                  if (copy_from_user(&temp, data, datasize))
>                                             ^^^^
> temp.block[0] is user controlled.
> 
>    372                          return -EFAULT;
>    373          }
>    374          if (size == I2C_SMBUS_I2C_BLOCK_BROKEN) {
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>    375                  /* Convert old I2C block commands to the new
>    376                     convention. This preserves binary compatibility. */
>    377                  size = I2C_SMBUS_I2C_BLOCK_DATA;
>    378                  if (read_write == I2C_SMBUS_READ)
>    379                          temp.block[0] = I2C_SMBUS_BLOCK_MAX;
>                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Except for size BROKEN
> 
>    380          }
>    381          res = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
>    382                read_write, command, size, &temp);
>                                                  ^^^^^
> 
>    383          if (!res && ((size == I2C_SMBUS_PROC_CALL) ||
>    384                       (size == I2C_SMBUS_BLOCK_PROC_CALL) ||
>    385                       (read_write == I2C_SMBUS_READ))) {
>    386                  if (copy_to_user(data, &temp, datasize))
>    387                          return -EFAULT;
>    388          }
> 
> The rest of the call tree seems straight forward but it's possible I
> have missed somewhere that checks data[0].  Here is how ft260_smbus_xfer()
> looks like.

Oh, you are right. Despite that the SMbus block transaction limits the maximum
number of bytes to 32, nothing prevents a user from specifying via ioctl a larger
data size than the ft260 can handle in a single transfer.

I am going to fix it in the ft260_smbus_write (with your Signed-off-by), but
perhaps we should fix it in the first place, in the i2cdev_ioctl_smbus routine?
What do you think?

> 
> drivers/hid/hid-ft260.c
>    655          case I2C_SMBUS_BLOCK_DATA:
>    656                  if (read_write == I2C_SMBUS_READ) {
>    657                          ret = ft260_smbus_write(dev, addr, cmd, NULL, 0,
>    658                                                  FT260_FLAG_START);
>    659                          if (ret)
>    660                                  goto smbus_exit;
>    661  
>    662                          ret = ft260_i2c_read(dev, addr, data->block,
>    663                                               data->block[0] + 1,
>    664                                               FT260_FLAG_START_STOP_REPEATED);
>    665                  } else {
>    666                          ret = ft260_smbus_write(dev, addr, cmd, data->block,
>    667                                                  data->block[0] + 1,
>    668                                                  FT260_FLAG_START_STOP);
>    669                  }
>    670                  break;
>    671          case I2C_SMBUS_I2C_BLOCK_DATA:
>    672                  if (read_write == I2C_SMBUS_READ) {
>    673                          ret = ft260_smbus_write(dev, addr, cmd, NULL, 0,
>    674                                                  FT260_FLAG_START);
>    675                          if (ret)
>    676                                  goto smbus_exit;
>    677  
>    678                          ret = ft260_i2c_read(dev, addr, data->block + 1,
>    679                                               data->block[0],
>    680                                               FT260_FLAG_START_STOP_REPEATED);
>    681                  } else {
>    682                          ret = ft260_smbus_write(dev, addr, cmd, data->block + 1,
>    683                                                  data->block[0],
>                                                         ^^^^^^^^^^^^^^
> Boom.  Dead.
> 
>    684                                                  FT260_FLAG_START_STOP);
>    685                  }
>    686                  break;
>    687          default:
>    688                  hid_err(hdev, "unsupported smbus transaction size %d\n", size);
>    689                  ret = -EOPNOTSUPP;
>    690          }
> 
> regards,
> dan carpenter
> 
> 
