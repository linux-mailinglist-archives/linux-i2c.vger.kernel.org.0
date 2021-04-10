Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16EE35AEE2
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 17:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbhDJPhh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 11:37:37 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:53086 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbhDJPhh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 11:37:37 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13AFTDMr085588;
        Sat, 10 Apr 2021 15:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=xpLUWPjm3/mfMiflMZXm2e2xo2tEdvvgnZrr/Ruz6No=;
 b=l7BhgXMrvNC+hsSD0y5z7Xb/s1e7w42yL0P1LQH5QBG105D3+842WSPl6v2geRerVfIM
 8ssh7L2gZuRA0Cb+a0VsEg+j1Z2yqWD2UE++aVQspawPbVlac+/AwOOuPsIu5pzvywXK
 xH9/hmhcJXcO5vgoDsKPhTqwgtQNq9s/3PePHqgVSSRXkrYePtFJixrR6/E4rWkovrIq
 /V6fogovqnGgyXJWoWVcZQA3bX5EupfPt3WE38E/EanP1cpvjIe41iMkbohIs6YqlaqY
 lhjtft6orqrtESDc85WfRVsdjV9/qXvvfigcJ++RX9ljhsJob/UtIi5MOkYpSHrRTZF8 fg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 37u1hb8qcd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 10 Apr 2021 15:37:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13AFUH0G020859;
        Sat, 10 Apr 2021 15:37:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 37u3g0cq4w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 10 Apr 2021 15:37:20 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13AFbJjq015912;
        Sat, 10 Apr 2021 15:37:19 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 10 Apr 2021 08:37:19 -0700
Date:   Sat, 10 Apr 2021 18:37:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Zaidman <michael.zaidman@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [bug report] HID: ft260: add usb hid to i2c host bridge driver
Message-ID: <20210410153712.GQ6048@kadam>
References: <YHBJRvcOSaM/b0RL@mwanda>
 <20210410122729.GA6136@michael-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410122729.GA6136@michael-VirtualBox>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9950 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104100117
X-Proofpoint-GUID: 0WlioviPpYgEYiB45pD3PWOO5DqyVlpW
X-Proofpoint-ORIG-GUID: 0WlioviPpYgEYiB45pD3PWOO5DqyVlpW
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9950 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104100117
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 10, 2021 at 03:27:29PM +0300, Michael Zaidman wrote:
> On Fri, Apr 09, 2021 at 03:32:06PM +0300, Dan Carpenter wrote:
> > Hello Michael Zaidman,
> > 
> > The patch 6a82582d9fa4: "HID: ft260: add usb hid to i2c host bridge
> > driver" from Feb 19, 2021, leads to the following static checker
> > warning:
> > 
> > 	drivers/hid/hid-ft260.c:441 ft260_smbus_write()
> > 	error: '__memcpy()' '&rep->data[1]' too small (59 vs 255)
> > 
> > drivers/hid/hid-ft260.c
> >    423  static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
> >    424                               u8 *data, u8 data_len, u8 flag)
> >    425  {
> >    426          int ret = 0;
> >    427          int len = 4;
> >    428  
> >    429          struct ft260_i2c_write_request_report *rep =
> >    430                  (struct ft260_i2c_write_request_report *)dev->write_buf;
> >    431  
> >    432          rep->address = addr;
> >    433          rep->data[0] = cmd;
> >    434          rep->length = data_len + 1;
> >    435          rep->flag = flag;
> >    436          len += rep->length;
> >    437  
> >    438          rep->report = FT260_I2C_DATA_REPORT_ID(len);
> >    439  
> >    440          if (data_len > 0)
> >    441                  memcpy(&rep->data[1], data, data_len);
> >                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Smatch says that this can be called from the i2cdev_ioctl_smbus()
> > function.
> 
> Hi Dan,
> 
> This is an example of a false-positive static checker warning.
> 
> The maximum data size that the i2cdev_ioctl_smbus() can pass to the
> i2c_smbus_xfer() is sizeof(data->block) which is (I2C_SMBUS_BLOCK_MAX + 2)
> or 34 bytes. Thus, no need to check the data_len against 59 here.
> 
> > 
> > i2cdev_ioctl_smbus()
> >   --> i2c_smbus_xfer
> >       --> __i2c_smbus_xfer
> >           --> ft260_smbus_xfer
> >               --> ft260_smbus_write

It's actually me who misunderstood the Smatch warning.  Smatch is not
complaining about data_len, it's data->block[0] which is user
controlled and only for the I2C_SMBUS_I2C_BLOCK_DATA command.

The call tree is the same.  I've looked at it again.  Here is how
i2cdev_ioctl_smbus() looks like:

drivers/i2c/i2c-dev.c
   355                  return -EINVAL;
   356          }
   357  
   358          if ((size == I2C_SMBUS_BYTE_DATA) ||
   359              (size == I2C_SMBUS_BYTE))
   360                  datasize = sizeof(data->byte);
   361          else if ((size == I2C_SMBUS_WORD_DATA) ||
   362                   (size == I2C_SMBUS_PROC_CALL))
   363                  datasize = sizeof(data->word);
   364          else /* size == smbus block, i2c block, or block proc. call */
   365                  datasize = sizeof(data->block);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   366  
   367          if ((size == I2C_SMBUS_PROC_CALL) ||
   368              (size == I2C_SMBUS_BLOCK_PROC_CALL) ||
   369              (size == I2C_SMBUS_I2C_BLOCK_DATA) ||
                             ^^^^^^^^^^^^^^^^^^^^^^^^
   370              (read_write == I2C_SMBUS_WRITE)) {
   371                  if (copy_from_user(&temp, data, datasize))
                                            ^^^^
temp.block[0] is user controlled.

   372                          return -EFAULT;
   373          }
   374          if (size == I2C_SMBUS_I2C_BLOCK_BROKEN) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   375                  /* Convert old I2C block commands to the new
   376                     convention. This preserves binary compatibility. */
   377                  size = I2C_SMBUS_I2C_BLOCK_DATA;
   378                  if (read_write == I2C_SMBUS_READ)
   379                          temp.block[0] = I2C_SMBUS_BLOCK_MAX;
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Except for size BROKEN

   380          }
   381          res = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
   382                read_write, command, size, &temp);
                                                 ^^^^^

   383          if (!res && ((size == I2C_SMBUS_PROC_CALL) ||
   384                       (size == I2C_SMBUS_BLOCK_PROC_CALL) ||
   385                       (read_write == I2C_SMBUS_READ))) {
   386                  if (copy_to_user(data, &temp, datasize))
   387                          return -EFAULT;
   388          }

The rest of the call tree seems straight forward but it's possible I
have missed somewhere that checks data[0].  Here is how ft260_smbus_xfer()
looks like.

drivers/hid/hid-ft260.c
   655          case I2C_SMBUS_BLOCK_DATA:
   656                  if (read_write == I2C_SMBUS_READ) {
   657                          ret = ft260_smbus_write(dev, addr, cmd, NULL, 0,
   658                                                  FT260_FLAG_START);
   659                          if (ret)
   660                                  goto smbus_exit;
   661  
   662                          ret = ft260_i2c_read(dev, addr, data->block,
   663                                               data->block[0] + 1,
   664                                               FT260_FLAG_START_STOP_REPEATED);
   665                  } else {
   666                          ret = ft260_smbus_write(dev, addr, cmd, data->block,
   667                                                  data->block[0] + 1,
   668                                                  FT260_FLAG_START_STOP);
   669                  }
   670                  break;
   671          case I2C_SMBUS_I2C_BLOCK_DATA:
   672                  if (read_write == I2C_SMBUS_READ) {
   673                          ret = ft260_smbus_write(dev, addr, cmd, NULL, 0,
   674                                                  FT260_FLAG_START);
   675                          if (ret)
   676                                  goto smbus_exit;
   677  
   678                          ret = ft260_i2c_read(dev, addr, data->block + 1,
   679                                               data->block[0],
   680                                               FT260_FLAG_START_STOP_REPEATED);
   681                  } else {
   682                          ret = ft260_smbus_write(dev, addr, cmd, data->block + 1,
   683                                                  data->block[0],
                                                        ^^^^^^^^^^^^^^
Boom.  Dead.

   684                                                  FT260_FLAG_START_STOP);
   685                  }
   686                  break;
   687          default:
   688                  hid_err(hdev, "unsupported smbus transaction size %d\n", size);
   689                  ret = -EOPNOTSUPP;
   690          }

regards,
dan carpenter


